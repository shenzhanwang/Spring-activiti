package controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pagemodel.DataGrid;
import pagemodel.LeaveTask;
import pagemodel.Process;
import pagemodel.data;
import po.LeaveApply;
import service.LeaveService;

import org.activiti.engine.form.FormProperty;
import org.activiti.engine.FormService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.form.StartFormData;
import org.activiti.engine.identity.User;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
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
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;

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
	
	@RequestMapping("/getprocesslists")
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
	
	@RequestMapping("/getprocesslists2")
	@ResponseBody
	public String getlist2(){
		List<ProcessDefinition> list=rep.createProcessDefinitionQuery().list();
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
		data d=new data();
		Process[] p=mylist.toArray(new Process[1]);
		d.setData(p);
		return JSON.toJSONString(d);
	}
	
	@RequestMapping("/processlist2")
	String process2(){
		return "activiti/processlist2";
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
		User user=identityservice.newUser(userid);
		Map<String,Object> variables=new HashMap<String, Object>();
		ProcessInstance ins=leaveservice.startWorkflow(apply, user.getId(), variables);
		System.out.println("流程id"+ins.getId()+"已启动");
		return JSON.toJSONString("sucess");
	}
	
	@RequestMapping(value="/depttasklist",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String getdepttasklist(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		int firstrow=(current-1)*rowCount;
		String userid=(String) session.getAttribute("username");
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
		DataGrid<LeaveTask> grid=new DataGrid<LeaveTask>();
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal(totalsize);
		grid.setRows(tasks);
		return JSON.toJSONString(grid);
	}
	
	@RequestMapping(value="/hrtasklist",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String gethrtasklist(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		int firstrow=(current-1)*rowCount;
		String userid=(String) session.getAttribute("username");
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
		DataGrid<LeaveTask> grid=new DataGrid<LeaveTask>();
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal(totalsize);
		grid.setRows(tasks);
		return JSON.toJSONString(grid);
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
	public String deptcomplete(@PathVariable("taskid") String taskid,HttpServletRequest req){
		Map<String,Object> variables=new HashMap<String,Object>();
		String approve=req.getParameter("deptleaderapprove");
		variables.put("deptleaderapprove", approve);
		taskservice.complete(taskid, variables);
		return JSON.toJSONString("success");
	}
	
	@RequestMapping(value="/task/hrcomplete/{taskid}")
	@ResponseBody
	public String hrcomplete(@PathVariable("taskid") String taskid,HttpServletRequest req){
		Map<String,Object> variables=new HashMap<String,Object>();
		String approve=req.getParameter("hrapprove");
		variables.put("hrapprove", approve);
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
}
