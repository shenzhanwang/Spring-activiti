package boot.spring.mapper;

import boot.spring.po.LeaveApply;

public interface LeaveApplyMapper {
	void save(LeaveApply apply);
	LeaveApply get(int id);
	void update(LeaveApply app);
}
