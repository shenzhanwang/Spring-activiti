package boot.spring.mapper;

import boot.spring.po.PurchaseApply;

public interface PurchaseApplyMapper {
	void save(PurchaseApply apply);
	
	PurchaseApply getPurchaseApply(int id);
	
	void updateByPrimaryKeySelective(PurchaseApply apply);
}
