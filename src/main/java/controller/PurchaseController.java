package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pagemodel.DataGrid;
import pagemodel.HistoryProcess;
import pagemodel.LeaveTask;
import pagemodel.MSG;
import pagemodel.PurchaseTask;
import pagemodel.RunningProcess;
import po.LeaveApply;
import po.PurchaseApply;
import po.Role;
import po.User;
import po.User_role;
import service.PurchaseService;
import service.SystemService;

import com.alibaba.fastjson.JSON;

@Controller
public class PurchaseController {
	@Autowired
	RepositoryService repositoryservice;
	@Autowired
	RuntimeService runservice;
	@Autowired
	TaskService taskservice;
	@Autowired
	HistoryService histiryservice;
	@Autowired
	SystemService systemservice;
	@Autowired
	PurchaseService purchaseservice;
	
	@RequestMapping("/purchase")
	String purchase(){
		return "purchase/purchaseapply";
	}
	
	@RequestMapping("/historypurchaseprocess")
	String historypurchaseprocess(){
		return "purchase/historypurchaseprocess";
	}
	
	@RequestMapping("/purchasemanager")
	String purchasemanager(){
		return "purchase/purchasemanager";
	}
	
	@RequestMapping("/finance")
	String finance(){
		return "purchase/finance";
	}
	
	@RequestMapping("/manager")
	String manager(){
		return "purchase/manager";
	}
	
	@RequestMapping("/pay")
	String pay(){
		return "purchase/pay";
	}
	
	@RequestMapping("/updateapply")
	String updateapply(){
		return "purchase/updateapply";
	}
	
	@RequestMapping("/receiveitem")
	String receiveitem(){
		return "purchase/receiveitem";
	}
	
	@RequestMapping("startpurchase")
	@ResponseBody
	String startpurchase(@RequestParam("itemlist")String itemlist,@RequestParam("total")float total,HttpSession session){
		String userid=(String) session.getAttribute("username");
		Map<String,Object> variables=new HashMap<String, Object>();
		variables.put("starter", userid);
		PurchaseApply purchase=new PurchaseApply();
		purchase.setApplyer(userid);
		purchase.setItemlist(itemlist);
		purchase.setTotal(total);
		purchase.setApplytime(new Date());
		ProcessInstance ins=purchaseservice.startWorkflow(purchase, userid, variables);
		System.out.println("流程id"+ins.getId()+"已启动");
		return JSON.toJSONString("sucess");
	}
	//我发起的采购流程
	@RequestMapping("mypurchaseprocess")
	@ResponseBody
	public DataGrid<RunningProcess> mypurchaseprocess(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		int firstrow=(current-1)*rowCount;
		String userid=(String) session.getAttribute("username");
		ProcessInstanceQuery query = runservice.createProcessInstanceQuery();
		int total= (int) query.count();
		List<ProcessInstance> a = query.processDefinitionKey("purchase").involvedUser(userid).listPage(firstrow, rowCount);
		List<RunningProcess> list=new ArrayList<RunningProcess>();
		for(ProcessInstance p:a){
			RunningProcess process=new RunningProcess();
			if(p.getActivityId()==null)
			{//有子流程
				String father=p.getProcessInstanceId();
				String sonactiveid=runservice.createExecutionQuery().parentId(father).singleResult().getActivityId();//子流程的活动节点
				String sonexeid=runservice.createExecutionQuery().parentId(father).singleResult().getId();
				process.setActivityid(sonactiveid);
				//System.out.println(taskservice.createTaskQuery().executionId(sonexeid).singleResult().getName());
			}else{
				process.setActivityid(p.getActivityId());
			}
			process.setBusinesskey(p.getBusinessKey());
			process.setExecutionid(p.getId());
			process.setProcessInstanceid(p.getProcessInstanceId());
			PurchaseApply l=purchaseservice.getPurchase(Integer.parseInt(p.getBusinessKey()));
			if(l.getApplyer().equals(userid))
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
	
	@RequestMapping("/mypurchase")
	String mypurchase(){
		return "purchase/mypurchase";
	}
	
	@RequestMapping("/puchasemanagertasklist")
	@ResponseBody
	DataGrid<PurchaseTask> puchasemanagertasklist(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		DataGrid<PurchaseTask> grid=new DataGrid<PurchaseTask>();
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal(0);
		grid.setRows(new ArrayList<PurchaseTask>());
		//先做权限检查，对于没有采购经理角色的用户,直接返回空
		String userid=(String) session.getAttribute("username");
		int uid=systemservice.getUidByusername(userid);
		User user=systemservice.getUserByid(uid);
		List<User_role> userroles=user.getUser_roles();
		if(userroles==null||userroles.size()==0)
			return grid;
		boolean flag=false;
		for(User_role ur:userroles)
		{
			Role r=ur.getRole();
			if(r.getRolename().equals("采购经理")){
				flag=true;
			}
		}
		if(flag){//有权限
			int firstrow=(current-1)*rowCount;
			List<PurchaseTask> results=new ArrayList<PurchaseTask>();
			List<Task> tasks=taskservice.createTaskQuery().taskCandidateGroup("采购经理").listPage(firstrow, rowCount);
			long totaltask=taskservice.createTaskQuery().taskCandidateGroup("采购经理").count();
			for(Task task:tasks){
				PurchaseTask vo=new PurchaseTask();
				String instanceid=task.getProcessInstanceId();
				ProcessInstance ins=runservice.createProcessInstanceQuery().processInstanceId(instanceid).singleResult();
				String businesskey=ins.getBusinessKey();
				PurchaseApply a=purchaseservice.getPurchase(Integer.parseInt(businesskey));
				vo.setApplyer(a.getApplyer());
				vo.setApplytime(a.getApplytime());
				vo.setBussinesskey(a.getId());
				vo.setItemlist(a.getItemlist());
				vo.setProcessdefid(task.getProcessDefinitionId());
				vo.setProcessinstanceid(task.getProcessInstanceId());
				vo.setTaskid(task.getId());
				vo.setTaskname(task.getName());
				vo.setTotal(a.getTotal());
				results.add(vo);
			}
			grid.setRowCount(rowCount);
			grid.setCurrent(current);
			grid.setTotal((int)totaltask);
			grid.setRows(results);
		}
		return grid;
	}
	
	@RequestMapping("task/purchasemanagercomplete/{taskid}")
	@ResponseBody
	public MSG purchasemanagercomplete(HttpSession session,@PathVariable("taskid") String taskid,HttpServletRequest req){
		String purchaseauditi=req.getParameter("purchaseauditi");
		String userid=(String) session.getAttribute("username");
		Map<String,Object> variables=new HashMap<String,Object>();
		variables.put("purchaseauditi", purchaseauditi);
		taskservice.claim(taskid, userid);
		taskservice.complete(taskid, variables);
		return new MSG("ok");
	}
	
	@RequestMapping("updatepurchaseapply")
	@ResponseBody
	public DataGrid<PurchaseTask> updateapply(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		int firstrow=(current-1)*rowCount;
		String userid=(String) session.getAttribute("username");
		TaskQuery query=taskservice.createTaskQuery().processDefinitionKey("purchase").taskCandidateOrAssigned(userid).taskDefinitionKey("updateapply");
		long total=query.count();
		List<Task> list=query.listPage(firstrow, rowCount);
		List<PurchaseTask> plist=new ArrayList<PurchaseTask>();
		for(Task task:list){
			PurchaseTask vo=new PurchaseTask();
			String instanceid=task.getProcessInstanceId();
			ProcessInstance ins=runservice.createProcessInstanceQuery().processInstanceId(instanceid).singleResult();
			String businesskey=ins.getBusinessKey();
			PurchaseApply a=purchaseservice.getPurchase(Integer.parseInt(businesskey));
			vo.setApplyer(a.getApplyer());
			vo.setApplytime(a.getApplytime());
			vo.setBussinesskey(a.getId());
			vo.setItemlist(a.getItemlist());
			vo.setProcessdefid(task.getProcessDefinitionId());
			vo.setProcessinstanceid(task.getProcessInstanceId());
			vo.setTaskid(task.getId());
			vo.setTaskname(task.getName());
			vo.setTotal(a.getTotal());
			plist.add(vo);
		}
		DataGrid<PurchaseTask> grid=new DataGrid<PurchaseTask>();
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal((int)total);
		grid.setRows(plist);
		return grid;
	}
	
	@RequestMapping("task/updateapplycomplete/{taskid}")
	@ResponseBody
	public MSG updateapplycomplete(HttpSession session,@PathVariable("taskid") String taskid,HttpServletRequest req){
		String updateapply=req.getParameter("updateapply");
		String userid=(String) session.getAttribute("username");
		if(updateapply.equals("true")){
			String itemlist=req.getParameter("itemlist");
			String total=req.getParameter("total");
			Task task=taskservice.createTaskQuery().taskId(taskid).singleResult();
			String instanceid=task.getProcessInstanceId();
			ProcessInstance ins=runservice.createProcessInstanceQuery().processInstanceId(instanceid).singleResult();
			String businesskey=ins.getBusinessKey();
			PurchaseApply p=purchaseservice.getPurchase(Integer.parseInt(businesskey));
			p.setItemlist(itemlist);
			p.setTotal(Float.parseFloat(total));
			purchaseservice.updatePurchase(p);
		}
		Map<String,Object> variables=new HashMap<String,Object>();
		variables.put("updateapply", Boolean.parseBoolean(updateapply));
		taskservice.claim(taskid, userid);
		taskservice.complete(taskid, variables);
		return new MSG("ok");
	}
	
	@RequestMapping("getfinishpurchaseprocess")
	@ResponseBody
	public DataGrid<HistoryProcess> getHistory(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		String userid=(String) session.getAttribute("username");
		HistoricProcessInstanceQuery process = histiryservice.createHistoricProcessInstanceQuery().processDefinitionKey("purchase").startedBy(userid).finished();
		int total= (int) process.count();
		int firstrow=(current-1)*rowCount;
		List<HistoricProcessInstance> info = process.listPage(firstrow, rowCount);
		List<HistoryProcess> list=new ArrayList<HistoryProcess>();
		for(HistoricProcessInstance history:info){
			HistoryProcess his=new HistoryProcess();
			String bussinesskey=history.getBusinessKey();
			PurchaseApply apply=purchaseservice.getPurchase(Integer.parseInt(bussinesskey));
			his.setPurchaseapply(apply);
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
	
	@RequestMapping("/financetasklist")
	@ResponseBody
	DataGrid<PurchaseTask> financetasklist(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		DataGrid<PurchaseTask> grid=new DataGrid<PurchaseTask>();
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal(0);
		grid.setRows(new ArrayList<PurchaseTask>());
		//先做权限检查，对于没有财务管理员角色的用户,直接返回空
		String userid=(String) session.getAttribute("username");
		int uid=systemservice.getUidByusername(userid);
		User user=systemservice.getUserByid(uid);
		List<User_role> userroles=user.getUser_roles();
		if(userroles==null||userroles.size()==0)
			return grid;
		boolean flag=false;
		for(User_role ur:userroles)
		{
			Role r=ur.getRole();
			if(r.getRolename().equals("财务管理员")){
				flag=true;
			}
		}
		if(flag){//有权限
			int firstrow=(current-1)*rowCount;
			List<PurchaseTask> results=new ArrayList<PurchaseTask>();
			List<Task> tasks=taskservice.createTaskQuery().taskCandidateGroup("财务管理员").listPage(firstrow, rowCount);
			long totaltask=taskservice.createTaskQuery().taskCandidateGroup("财务管理员").count();
			for(Task task:tasks){
				PurchaseTask vo=new PurchaseTask();
				String instanceid=task.getProcessInstanceId();
				ProcessInstance ins=runservice.createProcessInstanceQuery().processInstanceId(instanceid).singleResult();
				String businesskey=ins.getBusinessKey();
				PurchaseApply a=purchaseservice.getPurchase(Integer.parseInt(businesskey));
				vo.setApplyer(a.getApplyer());
				vo.setApplytime(a.getApplytime());
				vo.setBussinesskey(a.getId());
				vo.setItemlist(a.getItemlist());
				vo.setProcessdefid(task.getProcessDefinitionId());
				vo.setProcessinstanceid(task.getProcessInstanceId());
				vo.setTaskid(task.getId());
				vo.setTaskname(task.getName());
				vo.setTotal(a.getTotal());
				results.add(vo);
			}
			grid.setRowCount(rowCount);
			grid.setCurrent(current);
			grid.setTotal((int)totaltask);
			grid.setRows(results);
		}
		return grid;
	}
	
	@RequestMapping("task/financecomplete/{taskid}")
	@ResponseBody
	public MSG financecomplete(HttpSession session,@RequestParam("total")String total,@PathVariable("taskid") String taskid,HttpServletRequest req){
		String finance=req.getParameter("finance");
		String userid=(String) session.getAttribute("username");
		Map<String,Object> variables=new HashMap<String,Object>();
		variables.put("finance", finance);
		if(finance.equals("true"))
			variables.put("money", total);
		taskservice.claim(taskid, userid);
		taskservice.complete(taskid, variables);
		return new MSG("ok");
	}
	
	@RequestMapping("/managertasklist")
	@ResponseBody
	DataGrid<PurchaseTask> managertasklist(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		DataGrid<PurchaseTask> grid=new DataGrid<PurchaseTask>();
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal(0);
		grid.setRows(new ArrayList<PurchaseTask>());
		//先做权限检查，对于没有总经理角色的用户,直接返回空
		String userid=(String) session.getAttribute("username");
		int uid=systemservice.getUidByusername(userid);
		User user=systemservice.getUserByid(uid);
		List<User_role> userroles=user.getUser_roles();
		if(userroles==null||userroles.size()==0)
			return grid;
		boolean flag=false;
		for(User_role ur:userroles)
		{
			Role r=ur.getRole();
			if(r.getRolename().equals("总经理")){
				flag=true;
			}
		}
		if(flag){//有权限
			int firstrow=(current-1)*rowCount;
			List<PurchaseTask> results=new ArrayList<PurchaseTask>();
			List<Task> tasks=taskservice.createTaskQuery().taskCandidateGroup("总经理").listPage(firstrow, rowCount);
			long totaltask=taskservice.createTaskQuery().taskCandidateGroup("总经理").count();
			for(Task task:tasks){
				PurchaseTask vo=new PurchaseTask();
				String instanceid=task.getProcessInstanceId();
				ProcessInstance ins=runservice.createProcessInstanceQuery().processInstanceId(instanceid).singleResult();
				String businesskey=ins.getBusinessKey();
				PurchaseApply a=purchaseservice.getPurchase(Integer.parseInt(businesskey));
				vo.setApplyer(a.getApplyer());
				vo.setApplytime(a.getApplytime());
				vo.setBussinesskey(a.getId());
				vo.setItemlist(a.getItemlist());
				vo.setProcessdefid(task.getProcessDefinitionId());
				vo.setProcessinstanceid(task.getProcessInstanceId());
				vo.setTaskid(task.getId());
				vo.setTaskname(task.getName());
				vo.setTotal(a.getTotal());
				results.add(vo);
			}
			grid.setRowCount(rowCount);
			grid.setCurrent(current);
			grid.setTotal((int)totaltask);
			grid.setRows(results);
		}
		return grid;
	}
	
	@RequestMapping("task/managercomplete/{taskid}")
	@ResponseBody
	public MSG managercomplete(HttpSession session,@RequestParam("total")String total,@PathVariable("taskid") String taskid,HttpServletRequest req){
		String manager=req.getParameter("manager");
		String userid=(String) session.getAttribute("username");
		Map<String,Object> variables=new HashMap<String,Object>();
		variables.put("manager", manager);
		taskservice.claim(taskid, userid);
		taskservice.complete(taskid, variables);
		return new MSG("ok");
	}
	
	@RequestMapping("/paytasklist")
	@ResponseBody
	DataGrid<PurchaseTask> paytasklist(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		DataGrid<PurchaseTask> grid=new DataGrid<PurchaseTask>();
		grid.setRowCount(rowCount);
		grid.setCurrent(current);
		grid.setTotal(0);
		grid.setRows(new ArrayList<PurchaseTask>());
		//先做权限检查，对于没有出纳角色的用户,直接返回空
		String userid=(String) session.getAttribute("username");
		int uid=systemservice.getUidByusername(userid);
		User user=systemservice.getUserByid(uid);
		List<User_role> userroles=user.getUser_roles();
		if(userroles==null||userroles.size()==0)
			return grid;
		boolean flag=false;
		for(User_role ur:userroles)
		{
			Role r=ur.getRole();
			if(r.getRolename().equals("出纳员")){
				flag=true;
			}
		}
		if(flag){//有权限
			int firstrow=(current-1)*rowCount;
			List<PurchaseTask> results=new ArrayList<PurchaseTask>();
			List<Task> tasks=taskservice.createTaskQuery().taskCandidateGroup("出纳员").listPage(firstrow, rowCount);
			long totaltask=taskservice.createTaskQuery().taskCandidateGroup("出纳员").count();
			for(Task task:tasks){
				PurchaseTask vo=new PurchaseTask();
				String instanceid=task.getProcessInstanceId();
				ProcessInstance ins=runservice.createProcessInstanceQuery().processInstanceId(instanceid).singleResult();
				String businesskey=ins.getBusinessKey();
				PurchaseApply a=purchaseservice.getPurchase(Integer.parseInt(businesskey));
				vo.setApplyer(a.getApplyer());
				vo.setApplytime(a.getApplytime());
				vo.setBussinesskey(a.getId());
				vo.setItemlist(a.getItemlist());
				vo.setProcessdefid(task.getProcessDefinitionId());
				vo.setProcessinstanceid(task.getProcessInstanceId());
				vo.setTaskid(task.getId());
				vo.setTaskname(task.getName());
				vo.setTotal(a.getTotal());
				results.add(vo);
			}
			grid.setRowCount(rowCount);
			grid.setCurrent(current);
			grid.setTotal((int)totaltask);
			grid.setRows(results);
		}
		return grid;
	}
	
	@RequestMapping("task/paycomplete/{taskid}")
	@ResponseBody
	public MSG paycomplete(HttpSession session,@PathVariable("taskid") String taskid,HttpServletRequest req){
		String userid=(String) session.getAttribute("username");
		taskservice.claim(taskid, userid);
		taskservice.complete(taskid);
		return new MSG("ok");
	}
	
	
	@RequestMapping("/receivetasklist")
	@ResponseBody
	DataGrid<PurchaseTask> receivetasklist(HttpSession session,@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		int firstrow=(current-1)*rowCount;
		String userid=(String) session.getAttribute("username");
		TaskQuery query=taskservice.createTaskQuery().processDefinitionKey("purchase").taskCandidateOrAssigned(userid).taskDefinitionKey("receiveitem");
		long total=query.count();
		List<Task> tasks=query.listPage(firstrow, rowCount);
		List<PurchaseTask> results=new ArrayList<PurchaseTask>();
			for(Task task:tasks){
				PurchaseTask vo=new PurchaseTask();
				String instanceid=task.getProcessInstanceId();
				ProcessInstance ins=runservice.createProcessInstanceQuery().processInstanceId(instanceid).singleResult();
				String businesskey=ins.getBusinessKey();
				PurchaseApply a=purchaseservice.getPurchase(Integer.parseInt(businesskey));
				vo.setApplyer(a.getApplyer());
				vo.setApplytime(a.getApplytime());
				vo.setBussinesskey(a.getId());
				vo.setItemlist(a.getItemlist());
				vo.setProcessdefid(task.getProcessDefinitionId());
				vo.setProcessinstanceid(task.getProcessInstanceId());
				vo.setTaskid(task.getId());
				vo.setTaskname(task.getName());
				vo.setTotal(a.getTotal());
				results.add(vo);
			}
			DataGrid<PurchaseTask> grid=new DataGrid<PurchaseTask>();
			grid.setRowCount(rowCount);
			grid.setCurrent(current);
			grid.setTotal((int)total);
			grid.setRows(results);
		return grid;
	}
	
	@RequestMapping("task/receivecomplete/{taskid}")
	@ResponseBody
	public MSG receivecomplete(HttpSession session,@PathVariable("taskid") String taskid,HttpServletRequest req){
		String userid=(String) session.getAttribute("username");
		taskservice.claim(taskid, userid);
		taskservice.complete(taskid);
		return new MSG("ok");
	}
}
