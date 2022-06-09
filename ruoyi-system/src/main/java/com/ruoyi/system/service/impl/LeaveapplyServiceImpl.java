package com.ruoyi.system.service.impl;

import java.util.HashMap;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LeaveapplyMapper;
import com.ruoyi.system.domain.Leaveapply;
import com.ruoyi.system.service.ILeaveapplyService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 请假Service业务层处理
 * 
 * @author shenzhanwang
 * @date 2022-04-02
 */
@Service
@Transactional
public class LeaveapplyServiceImpl implements ILeaveapplyService 
{
    @Resource
    private LeaveapplyMapper leaveapplyMapper;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;

    @Resource
    IdentityService identityService;

    /**
     * 查询请假
     * 
     * @param id 请假主键
     * @return 请假
     */
    @Override
    public Leaveapply selectLeaveapplyById(Long id)
    {
        return leaveapplyMapper.selectLeaveapplyById(id);
    }

    /**
     * 查询请假列表
     * 
     * @param leaveapply 请假
     * @return 请假
     */
    @Override
    public List<Leaveapply> selectLeaveapplyList(Leaveapply leaveapply)
    {
        return leaveapplyMapper.selectLeaveapplyList(leaveapply);
    }

    /**
     * 新增请假
     * 
     * @param leaveapply 请假
     * @return 结果
     */
    @Override
    public int insertLeaveapply(Leaveapply leaveapply)
    {
        int rows = leaveapplyMapper.insertLeaveapply(leaveapply);
        // 发起请假流程
        identityService.setAuthenticatedUserId(leaveapply.getUserId());
        HashMap<String, Object> variables = new HashMap<>();
        variables.put("applyuserid", leaveapply.getUserId());
        variables.put("deptleader", leaveapply.getDeptleader());
        runtimeService.startProcessInstanceByKey("leave", String.valueOf(leaveapply.getId()), variables);
        return rows;
    }

    /**
     * 修改请假
     * 
     * @param leaveapply 请假
     * @return 结果
     */
    @Override
    public int updateLeaveapply(Leaveapply leaveapply)
    {
        return leaveapplyMapper.updateLeaveapply(leaveapply);
    }

    /**
     * 批量删除请假
     * 
     * @param ids 需要删除的请假主键
     * @return 结果
     */
    @Override
    public int deleteLeaveapplyByIds(String ids)
    {
        String[] keys = Convert.toStrArray(ids);
        for (String key : keys) {
            ProcessInstance process = runtimeService.createProcessInstanceQuery().processDefinitionKey("leave").processInstanceBusinessKey(key).singleResult();
            try {
                runtimeService.deleteProcessInstance(process.getId(),"删除");
            } catch (Exception e) {
                e.printStackTrace();
            }
            leaveapplyMapper.deleteLeaveapplyById(Long.parseLong(key));
        }
        return keys.length;
    }

    /**
     * 删除请假信息
     * 
     * @param id 请假主键
     * @return 结果
     */
    @Override
    public int deleteLeaveapplyById(Long id)
    {
        return leaveapplyMapper.deleteLeaveapplyById(id);
    }
}
