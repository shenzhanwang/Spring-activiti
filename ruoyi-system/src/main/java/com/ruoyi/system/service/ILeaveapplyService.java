package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Leaveapply;

/**
 * 请假Service接口
 * 
 * @author shenzhanwang
 * @date 2022-04-02
 */
public interface ILeaveapplyService 
{
    /**
     * 查询请假
     * 
     * @param id 请假主键
     * @return 请假
     */
    public Leaveapply selectLeaveapplyById(Long id);

    /**
     * 查询请假列表
     * 
     * @param leaveapply 请假
     * @return 请假集合
     */
    public List<Leaveapply> selectLeaveapplyList(Leaveapply leaveapply);

    /**
     * 新增请假
     * 
     * @param leaveapply 请假
     * @return 结果
     */
    public int insertLeaveapply(Leaveapply leaveapply);

    /**
     * 修改请假
     * 
     * @param leaveapply 请假
     * @return 结果
     */
    public int updateLeaveapply(Leaveapply leaveapply);

    /**
     * 批量删除请假
     * 
     * @param ids 需要删除的请假主键集合
     * @return 结果
     */
    public int deleteLeaveapplyByIds(String ids);

    /**
     * 删除请假信息
     * 
     * @param id 请假主键
     * @return 结果
     */
    public int deleteLeaveapplyById(Long id);
}
