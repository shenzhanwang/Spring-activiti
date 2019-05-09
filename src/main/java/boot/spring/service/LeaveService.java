package boot.spring.service;

import java.util.List;
import java.util.Map;

import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.runtime.ProcessInstance;

import boot.spring.po.LeaveApply;


public interface LeaveService {
	public ProcessInstance startWorkflow(LeaveApply apply,String userid,Map<String,Object> variables);
	public List<LeaveApply> getpagedepttask(String userid,int firstrow,int rowcount);
	public int getalldepttask(String userid);
	public LeaveApply getleave(int id);
	public List<LeaveApply> getpagehrtask(String userid,int firstrow,int rowcount);
	public int getallhrtask(String userid);
	public List<LeaveApply> getpageXJtask(String userid,int firstrow,int rowcount);
	public int getallXJtask(String userid);
	public List<LeaveApply> getpageupdateapplytask(String userid,int firstrow,int rowcount);
	public int getallupdateapplytask(String userid);
	public void completereportback(String taskid, String realstart_time, String realend_time);
	public void updatecomplete(String taskid, LeaveApply leave,String reappply);
	public List<String> getHighLightedFlows(ProcessDefinitionEntity deployedProcessDefinition,List<HistoricActivityInstance> historicActivityInstances);
}
