package controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.activiti.image.impl.DefaultProcessDiagramGenerator;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pagemodel.DataGrid;
import pagemodel.HistoryProcess;
import pagemodel.LeaveTask;
import pagemodel.Process;
import pagemodel.RunningProcess;
import po.LeaveApply;
import po.Permission;
import po.Role;
import po.Role_permission;
import po.User;
import po.User_role;
import service.LeaveService;
import service.SystemService;

import com.alibaba.fastjson.JSON;

@Controller
public class ActivitiController {
	@Autowired
	RepositoryService rep;
	@Autowired
	RuntimeService runservice;
	@Autowired
	FormService formservice;
	@Autowired
	IdentityService identityservice;
	@Autowired
	LeaveService leaveservice;
	@Autowired
	TaskService taskservice;
	@Autowired
	HistoryService histiryservice;
	@Autowired
	SystemService systemservice;
	
	@RequestMapping("/processlist")
	String process(){
		return "activiti/processlist";
	}
	
	@RequestMapping("/uploadworkflow")
	public String fileupload(@RequestParam MultipartFile uploadfile,HttpServletRequest request){
		try{
			MultipartFile file=uploadfile;
			String filename=file.getOriginalFilename();
			InputStream is=file.getInputStream();
			rep.createDeployment().addInputStream(filename, is).deploy();
		}catch(Exception e){
			e.printStackTrace();
		}
		return "index";
	}
	
	@RequestMapping(value="/getprocesslists")
	@ResponseBody
	public DataGrid<Process> getlist(@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		int firstrow=(current-1)*rowCount;
		List<ProcessDefinition> list=rep.createProcessDefinitionQuery().listPage(firstrow, rowCount);
		int total=rep.createProcessDefinitionQuery().list().size();
		List<Process> mylist=new ArrayList<Process>();
		for(int i=0;i<list.size();i++)
		{
			Process p=new Process();
			p.setDeploymentId(list.get(i).getDeploymentId());
			p.setId(list.get(i).getId());
			p.setKey(list.get(i).getKey());
			p.setName(list.get(i).getName());
			p.setResourceName(list.get(i).getResourceName());
			p.setDiagramresourcename(list.get(i).getDiagramResourceName());
			mylist.add(p);
		}
		DataGrid<Process> grid=new DataGrid<Process>();
		grid.setCurrent(current);
		grid.setRowCount(rowCount);
		grid.setRows(mylist);
		grid.setTotal(total);
		return grid;
	}
	
	
	@RequestMapping("/showresource")
	public void export(@RequestParam("pdid") String pdid,@RequestParam("resource") String resource,HttpServletResponse response) throws Exception{
		ProcessDefinition def=rep.createProcessDefinitionQuery().processDefinitionId(pdid).singleResult();
		InputStream is=rep.getResourceAsStream(def.getDeploymentId(), resource);
		ServletOutputStream output = response.getOutputStream();
		IOUtils.copy(is, output);
	}
	
	@RequestMapping("/deletedeploy")
	public String deletedeploy(@RequestParam("deployid") String deployid) throws Exception{
		rep.deleteDeployment(deployid,true);
		return "activiti/processlist";
	}
	
	@RequestMapping("/runningprocess")
	public String task(){
		return "activiti/runningprocess";
	} 
	
	@RequestMapping("/deptleaderaudit")
	public String mytask(){
		return "activiti/deptleaderaudit"; 
	}
	
	@RequestMapping("/hraudit")
	public String hr(){
		return "activiti/hraudit"; 
	}
	
	@RequestMapping("/index")
	public String my(){
		return "index"; 
	}
	
	@RequestMapping("/leaveapply")
	public String leave(){
		return "activiti/leaveapply"; 
	}
	
	@RequestMapping("/reportback")
	public String reprotback(){
		return "activiti/reportback"; 
	}
	
	@RequestMapping("/modifyapply")
	public String modifyapply(){
		return "activiti/modifyapply"; 
	}
	@RequestMapping(value="/startleave",method=RequestMethod.POST)
	@ResponseBody
	public String start_leave(LeaveApply apply,HttpSession session){
		String userid=(String) session.getAttribute("username");
		Map<String,Object> variables=new HashMap<String, Object>();
		variables.put("applyuserid", userid);
		ProcessInstance ins=leaveservice.startWorkflow(apply, userid, variables);
		System.out.println("流程id"+ins.getId()+"已启动");
		return JSON.toJSONString("sucess");
	}
	
	@RequestMapping(value="/depttasklist",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public DataGrid<LeaveTask> getdepttasklist(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		DataGrid<LeaveTask> grid=new DataGrid<LeaveTask>();
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal(0);
		grid.setRows(new ArrayList<LeaveTask>());
		//先做权限检查，对于没有部门领导审批权限的用户,直接返回空
		String userid=(String) session.getAttribute("username");
		int uid=systemservice.getUidByusername(userid);
		User user=systemservice.getUserByid(uid);
		List<User_role> userroles=user.getUser_roles();
		if(userroles==null)
			return grid;
		boolean flag=false;//默认没有权限
		for(int k=0;k<userroles.size();k++){
			User_role ur=userroles.get(k);
			Role r=ur.getRole();
			int roleid=r.getRid();
			Role role=systemservice.getRolebyid(roleid);
			List<Role_permission> p=role.getRole_permission();
			for(int j=0;j<p.size();j++){
				Role_permission rp=p.get(j);
				Permission permission=rp.getPermission();
				if(permission.getPermissionname().equals("部门领导审批"))
					flag=true;
				else
					continue;
			}
		}
			if(flag==false)//无权限
			{
				return grid;
			}else{
				int firstrow=(current-1)*rowCount;
				List<LeaveApply> results=leaveservice.getpagedepttask(userid,firstrow,rowCount);
				int totalsize=leaveservice.getalldepttask(userid);
				List<LeaveTask> tasks=new ArrayList<LeaveTask>();
				for(LeaveApply apply:results){
					LeaveTask task=new LeaveTask();
					task.setApply_time(apply.getApply_time());
					task.setUser_id(apply.getUser_id());
					task.setEnd_time(apply.getEnd_time());
					task.setId(apply.getId());
					task.setLeave_type(apply.getLeave_type());
					task.setProcess_instance_id(apply.getProcess_instance_id());
					task.setProcessdefid(apply.getTask().getProcessDefinitionId());
					task.setReason(apply.getReason());
					task.setStart_time(apply.getStart_time());
					task.setTaskcreatetime(apply.getTask().getCreateTime());
					task.setTaskid(apply.getTask().getId());
					task.setTaskname(apply.getTask().getName());
					tasks.add(task);
				}
				grid.setRowCount(rowCount);
				grid.setCurrent(current);
				grid.setTotal(totalsize);
				grid.setRows(tasks);
				return grid;
			}
	}
	
	@RequestMapping(value="/hrtasklist",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public DataGrid<LeaveTask> gethrtasklist(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		DataGrid<LeaveTask> grid=new DataGrid<LeaveTask>();
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal(0);
		grid.setRows(new ArrayList<LeaveTask>());
		//先做权限检查，对于没有人事权限的用户,直接返回空
		String userid=(String) session.getAttribute("username");
		int uid=systemservice.getUidByusername(userid);
		User user=systemservice.getUserByid(uid);
		List<User_role> userroles=user.getUser_roles();
		if(userroles==null)
			return grid;
		boolean flag=false;//默认没有权限
		for(int k=0;k<userroles.size();k++){
			User_role ur=userroles.get(k);
			Role r=ur.getRole();
			int roleid=r.getRid();
			Role role=systemservice.getRolebyid(roleid);
			List<Role_permission> p=role.getRole_permission();
			for(int j=0;j<p.size();j++){
				Role_permission rp=p.get(j);
				Permission permission=rp.getPermission();
				if(permission.getPermissionname().equals("人事审批"))
					flag=true;
				else
					continue;
			}
		}
			if(flag==false)//无权限
			{
				return grid;
			}else{
		int firstrow=(current-1)*rowCount;
		List<LeaveApply> results=leaveservice.getpagehrtask(userid,firstrow,rowCount);
		int totalsize=leaveservice.getallhrtask(userid);
		List<LeaveTask> tasks=new ArrayList<LeaveTask>();
		for(LeaveApply apply:results){
			LeaveTask task=new LeaveTask();
			task.setApply_time(apply.getApply_time());
			task.setUser_id(apply.getUser_id());
			task.setEnd_time(apply.getEnd_time());
			task.setId(apply.getId());
			task.setLeave_type(apply.getLeave_type());
			task.setProcess_instance_id(apply.getProcess_instance_id());
			task.setProcessdefid(apply.getTask().getProcessDefinitionId());
			task.setReason(apply.getReason());
			task.setStart_time(apply.getStart_time());
			task.setTaskcreatetime(apply.getTask().getCreateTime());
			task.setTaskid(apply.getTask().getId());
			task.setTaskname(apply.getTask().getName());
			tasks.add(task);
		}
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal(totalsize);
		grid.setRows(tasks);
		return grid;
			}
	}
	
	@RequestMapping(value="/xjtasklist",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String getXJtasklist(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		int firstrow=(current-1)*rowCount;
		String userid=(String) session.getAttribute("username");
		List<LeaveApply> results=leaveservice.getpageXJtask(userid,firstrow,rowCount);
		int totalsize=leaveservice.getallXJtask(userid);
		List<LeaveTask> tasks=new ArrayList<LeaveTask>();
		for(LeaveApply apply:results){
			LeaveTask task=new LeaveTask();
			task.setApply_time(apply.getApply_time());
			task.setUser_id(apply.getUser_id());
			task.setEnd_time(apply.getEnd_time());
			task.setId(apply.getId());
			task.setLeave_type(apply.getLeave_type());
			task.setProcess_instance_id(apply.getProcess_instance_id());
			task.setProcessdefid(apply.getTask().getProcessDefinitionId());
			task.setReason(apply.getReason());
			task.setStart_time(apply.getStart_time());
			task.setTaskcreatetime(apply.getTask().getCreateTime());
			task.setTaskid(apply.getTask().getId());
			task.setTaskname(apply.getTask().getName());
			tasks.add(task);
		}
		DataGrid<LeaveTask> grid=new DataGrid<LeaveTask>();
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal(totalsize);
		grid.setRows(tasks);
		return JSON.toJSONString(grid);
	}
	
	
	@RequestMapping(value="/updatetasklist",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String getupdatetasklist(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		int firstrow=(current-1)*rowCount;
		String userid=(String) session.getAttribute("username");
		List<LeaveApply> results=leaveservice.getpageupdateapplytask(userid,firstrow,rowCount);
		int totalsize=leaveservice.getallupdateapplytask(userid);
		List<LeaveTask> tasks=new ArrayList<LeaveTask>();
		for(LeaveApply apply:results){
			LeaveTask task=new LeaveTask();
			task.setApply_time(apply.getApply_time());
			task.setUser_id(apply.getUser_id());
			task.setEnd_time(apply.getEnd_time());
			task.setId(apply.getId());
			task.setLeave_type(apply.getLeave_type());
			task.setProcess_instance_id(apply.getProcess_instance_id());
			task.setProcessdefid(apply.getTask().getProcessDefinitionId());
			task.setReason(apply.getReason());
			task.setStart_time(apply.getStart_time());
			task.setTaskcreatetime(apply.getTask().getCreateTime());
			task.setTaskid(apply.getTask().getId());
			task.setTaskname(apply.getTask().getName());
			tasks.add(task);
		}
		DataGrid<LeaveTask> grid=new DataGrid<LeaveTask>();
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal(totalsize);
		grid.setRows(tasks);
		return JSON.toJSONString(grid);
	}
	
	@RequestMapping(value="/dealtask")
	@ResponseBody
	public String taskdeal(@RequestParam("taskid") String taskid,HttpServletResponse response){
		Task task=taskservice.createTaskQuery().taskId(taskid).singleResult();
		ProcessInstance process=runservice.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
		LeaveApply leave=leaveservice.getleave(new Integer(process.getBusinessKey()));
		return JSON.toJSONString(leave);
	}
	
	@RequestMapping(value="/activiti/task-deptleaderaudit")
	String url(){
		return "/activiti/task-deptleaderaudit";
	}
	
	@RequestMapping(value="/task/deptcomplete/{taskid}")
	@ResponseBody
	public String deptcomplete(HttpSession session,@PathVariable("taskid") String taskid,HttpServletRequest req){
		String userid=(String) session.getAttribute("username");
		Map<String,Object> variables=new HashMap<String,Object>();
		String approve=req.getParameter("deptleaderapprove");
		variables.put("deptleaderapprove", approve);
		taskservice.claim(taskid, userid);
		taskservice.complete(taskid, variables);
		return JSON.toJSONString("success");
	}
	
	@RequestMapping(value="/task/hrcomplete/{taskid}")
	@ResponseBody
	public String hrcomplete(HttpSession session,@PathVariable("taskid") String taskid,HttpServletRequest req){
		String userid=(String) session.getAttribute("username");
		Map<String,Object> variables=new HashMap<String,Object>();
		String approve=req.getParameter("hrapprove");
		variables.put("hrapprove", approve);
		taskservice.claim(taskid, userid);
		taskservice.complete(taskid, variables);
		return JSON.toJSONString("success");
	}
	
	@RequestMapping(value="/task/reportcomplete/{taskid}")
	@ResponseBody
	public String reportbackcomplete(@PathVariable("taskid") String taskid,HttpServletRequest req){
		String realstart_time=req.getParameter("realstart_time");
		String realend_time=req.getParameter("realend_time");
		leaveservice.completereportback(taskid,realstart_time,realend_time);
		return JSON.toJSONString("success");
	}
	
	@RequestMapping(value="/task/updatecomplete/{taskid}")
	@ResponseBody
	public String updatecomplete(@PathVariable("taskid") String taskid,@ModelAttribute("leave") LeaveApply leave,@RequestParam("reapply") String reapply){
		leaveservice.updatecomplete(taskid,leave,reapply);
		return JSON.toJSONString("success");
	}
	
	@RequestMapping("involvedprocess")//参与的正在运行的请假流程
	@ResponseBody
	public DataGrid<RunningProcess> allexeution(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		int firstrow=(current-1)*rowCount;
		String userid=(String) session.getAttribute("username");
		ProcessInstanceQuery query = runservice.createProcessInstanceQuery();
		int total= (int) query.count();
		List<ProcessInstance> a = query.processDefinitionKey("leave").involvedUser(userid).listPage(firstrow, rowCount);
		List<RunningProcess> list=new ArrayList<RunningProcess>();
		for(ProcessInstance p:a){
			RunningProcess process=new RunningProcess();
			process.setActivityid(p.getActivityId());
			process.setBusinesskey(p.getBusinessKey());
			process.setExecutionid(p.getId());
			process.setProcessInstanceid(p.getProcessInstanceId());
			list.add(process);
		}
		DataGrid<RunningProcess> grid=new DataGrid<RunningProcess>();
		grid.setCurrent(current);
		grid.setRowCount(rowCount);
		grid.setTotal(total);
		grid.setRows(list);
		return grid;
	}
	
	@RequestMapping("/getfinishprocess")
	@ResponseBody
	public DataGrid<HistoryProcess> getHistory(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		String userid=(String) session.getAttribute("username");
		HistoricProcessInstanceQuery process = histiryservice.createHistoricProcessInstanceQuery().processDefinitionKey("leave").startedBy(userid).finished();
		int total= (int) process.count();
		int firstrow=(current-1)*rowCount;
		List<HistoricProcessInstance> info = process.listPage(firstrow, rowCount);
		List<HistoryProcess> list=new ArrayList<HistoryProcess>();
		for(HistoricProcessInstance history:info){
			HistoryProcess his=new HistoryProcess();
			String bussinesskey=history.getBusinessKey();
			LeaveApply apply=leaveservice.getleave(Integer.parseInt(bussinesskey));
			his.setLeaveapply(apply);
			his.setBusinessKey(bussinesskey);
			his.setProcessDefinitionId(history.getProcessDefinitionId());
			list.add(his);
		}
		DataGrid<HistoryProcess> grid=new DataGrid<HistoryProcess>();
		grid.setCurrent(current);
		grid.setRowCount(rowCount);
		grid.setTotal(total);
		grid.setRows(list);
		return grid;
	}
	
	
	@RequestMapping("/historyprocess")
	public String history(){
		return "activiti/historyprocess";
	}
	
	
	@RequestMapping("/processinfo")
	@ResponseBody
	public List<HistoricActivityInstance> processinfo(@RequestParam("instanceid")String instanceid){
		  List<HistoricActivityInstance> his = histiryservice.createHistoricActivityInstanceQuery().processInstanceId(instanceid).orderByHistoricActivityInstanceStartTime().asc().list();
		  return his;
	}
	
	@RequestMapping("/processhis")
	@ResponseBody
	public List<HistoricActivityInstance> processhis(@RequestParam("ywh")String ywh){
		  String instanceid=histiryservice.createHistoricProcessInstanceQuery().processDefinitionKey("purchase").processInstanceBusinessKey(ywh).singleResult().getId();
		  System.out.println(instanceid);
		  List<HistoricActivityInstance> his = histiryservice.createHistoricActivityInstanceQuery().processInstanceId(instanceid).orderByHistoricActivityInstanceStartTime().asc().list();
		  return his;
	}
	
	@RequestMapping("myleaveprocess")
	String myleaveprocess(){
		return "activiti/myleaveprocess";
	}
	
	@RequestMapping("traceprocess/{executionid}")
	public void traceprocess(@PathVariable("executionid")String executionid,HttpServletResponse response) throws Exception{
		ProcessInstance process=runservice.createProcessInstanceQuery().processInstanceId(executionid).singleResult();
		BpmnModel bpmnmodel=rep.getBpmnModel(process.getProcessDefinitionId());
		List<String> activeActivityIds=runservice.getActiveActivityIds(executionid);
		DefaultProcessDiagramGenerator gen=new DefaultProcessDiagramGenerator();
		 // 获得历史活动记录实体（通过启动时间正序排序，不然有的线可以绘制不出来）  
	    List<HistoricActivityInstance> historicActivityInstances = histiryservice  
	            .createHistoricActivityInstanceQuery().executionId(executionid)  
	            .orderByHistoricActivityInstanceStartTime().asc().list();  
	    // 计算活动线  
	    List<String> highLightedFlows = leaveservice.getHighLightedFlows(  
	                    (ProcessDefinitionEntity) ((RepositoryServiceImpl) rep)  
	                            .getDeployedProcessDefinition(process.getProcessDefinitionId()),  
	                    historicActivityInstances); 
		
		InputStream in=gen.generateDiagram(bpmnmodel, "png", activeActivityIds,highLightedFlows,"宋体","宋体",null,1.0);
	    //InputStream in=gen.generateDiagram(bpmnmodel, "png", activeActivityIds);
	    ServletOutputStream output = response.getOutputStream();
		IOUtils.copy(in, output);
	}
	
	@RequestMapping("myleaves")
	String myleaves(){
		return "activiti/myleaves";
	}
	
	@RequestMapping("setupprocess")
	@ResponseBody
	public DataGrid<RunningProcess> setupprocess(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		int firstrow=(current-1)*rowCount;
		String userid=(String) session.getAttribute("username");
		ProcessInstanceQuery query = runservice.createProcessInstanceQuery();
		int total= (int) query.count();
		List<ProcessInstance> a = query.processDefinitionKey("leave").involvedUser(userid).listPage(firstrow, rowCount);
		List<RunningProcess> list=new ArrayList<RunningProcess>();
		for(ProcessInstance p:a){
			RunningProcess process=new RunningProcess();
			process.setActivityid(p.getActivityId());
			process.setBusinesskey(p.getBusinessKey());
			process.setExecutionid(p.getId());
			process.setProcessInstanceid(p.getProcessInstanceId());
			LeaveApply l=leaveservice.getleave(Integer.parseInt(p.getBusinessKey()));
			if(l.getUser_id().equals(userid))
			list.add(process);
			else
			continue;
		}
		DataGrid<RunningProcess> grid=new DataGrid<RunningProcess>();
		grid.setCurrent(current);
		grid.setRowCount(rowCount);
		grid.setTotal(total);
		grid.setRows(list);
		return grid;
	}
	
}
