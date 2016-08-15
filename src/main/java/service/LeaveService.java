package service;

import java.util.List;
import java.util.Map;
import org.activiti.engine.runtime.ProcessInstance;
import po.LeaveApply;

public interface LeaveService {
	public ProcessInstance startWorkflow(LeaveApply apply,String userid,Map<String,Object> variables);
	public List<LeaveApply> getalldepttask(String userid);
	public LeaveApply getleave(int id);
	public List<LeaveApply> getallhrtask(String userid);
	public List<LeaveApply> getallXJtask(String userid);
	public List<LeaveApply> getallupdateapplytask(String userid);
	public void completereportback(String taskid, String realstart_time, String realend_time);
	public void updatecomplete(String taskid, LeaveApply leave,String reappply);
}
