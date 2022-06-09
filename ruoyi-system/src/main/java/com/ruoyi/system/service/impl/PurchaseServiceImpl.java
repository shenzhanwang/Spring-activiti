package com.ruoyi.system.service.impl;

import java.util.HashMap;
import java.util.List;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.PurchaseMapper;
import com.ruoyi.system.domain.Purchase;
import com.ruoyi.system.service.IPurchaseService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 采购Service业务层处理
 * 
 * @author shenzhanwang
 * @date 2022-05-28
 */
@Service
@Transactional
public class PurchaseServiceImpl implements IPurchaseService 
{
    @Autowired
    private PurchaseMapper purchaseMapper;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;

    @Resource
    IdentityService identityService;

    /**
     * 查询采购
     * 
     * @param id 采购主键
     * @return 采购
     */
    @Override
    public Purchase selectPurchaseById(Long id)
    {
        return purchaseMapper.selectPurchaseById(id);
    }

    /**
     * 查询采购列表
     * 
     * @param purchase 采购
     * @return 采购
     */
    @Override
    public List<Purchase> selectPurchaseList(Purchase purchase)
    {
        return purchaseMapper.selectPurchaseList(purchase);
    }

    /**
     * 新增采购
     * 
     * @param purchase 采购
     * @return 结果
     */
    @Override
    public int insertPurchase(Purchase purchase)
    {
        int row = purchaseMapper.insertPurchase(purchase);
        // 启动采购流程
        identityService.setAuthenticatedUserId(purchase.getApplyer());
        HashMap<String, Object> variables = new HashMap<>();
        variables.put("starter", purchase.getApplyer());
        variables.put("purchasemanager", purchase.getPurchasemanager());
        variables.put("finance", purchase.getFinance());
        variables.put("pay", purchase.getPay());
        variables.put("manager", purchase.getManager());
        variables.put("money", Double.parseDouble(purchase.getTotal()));
        runtimeService.startProcessInstanceByKey("purchase", String.valueOf(purchase.getId()), variables);
        return row;
    }

    /**
     * 修改采购
     * 
     * @param purchase 采购
     * @return 结果
     */
    @Override
    public int updatePurchase(Purchase purchase)
    {
        return purchaseMapper.updatePurchase(purchase);
    }

    /**
     * 批量删除采购
     * 
     * @param ids 需要删除的采购主键
     * @return 结果
     */
    @Override
    public int deletePurchaseByIds(String ids)
    {
        String[] keys = Convert.toStrArray(ids);
        for (String key : keys) {
            ProcessInstance process = runtimeService.createProcessInstanceQuery().processDefinitionKey("purchase").processInstanceBusinessKey(key).singleResult();
            try {
                runtimeService.deleteProcessInstance(process.getId(),"删除");
            } catch (Exception e) {
                e.printStackTrace();
            }
            purchaseMapper.deletePurchaseByIds(Convert.toStrArray(ids));
        }
        return keys.length;
    }

    /**
     * 删除采购信息
     * 
     * @param id 采购主键
     * @return 结果
     */
    @Override
    public int deletePurchaseById(Long id)
    {
        return purchaseMapper.deletePurchaseById(id);
    }
}
