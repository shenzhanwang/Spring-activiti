package boot.spring.mapper;

import boot.spring.po.LeaveApply;

public interface LeaveApplyMapper {
	void save(LeaveApply apply);

	LeaveApply getLeaveApply(int id);

	int updateByPrimaryKey(LeaveApply record);
}
