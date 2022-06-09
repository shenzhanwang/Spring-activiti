package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 请假对象 leaveapply
 * 
 * @author shenzhanwang
 * @date 2022-04-02
 */
public class Leaveapply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 请假人 */
    @Excel(name = "请假人")
    private String userId;

    /** 起始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "起始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 类型 */
    @Excel(name = "类型")
    private String leaveType;

    /** 原因 */
    @Excel(name = "原因")
    private String reason;

    /** 申请时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "申请时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date applyTime;

    /** 实际起始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "实际起始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date realityStartTime;

    /** 实际结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "实际结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date realityEndTime;
    /**
     * 部门领导审批人
     **/
    private String deptleader;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }
    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }
    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }
    public void setLeaveType(String leaveType) 
    {
        this.leaveType = leaveType;
    }

    public String getLeaveType() 
    {
        return leaveType;
    }
    public void setReason(String reason) 
    {
        this.reason = reason;
    }

    public String getReason() 
    {
        return reason;
    }
    public void setApplyTime(Date applyTime) 
    {
        this.applyTime = applyTime;
    }

    public Date getApplyTime() 
    {
        return applyTime;
    }
    public void setRealityStartTime(Date realityStartTime) 
    {
        this.realityStartTime = realityStartTime;
    }

    public Date getRealityStartTime() 
    {
        return realityStartTime;
    }
    public void setRealityEndTime(Date realityEndTime) 
    {
        this.realityEndTime = realityEndTime;
    }

    public Date getRealityEndTime() 
    {
        return realityEndTime;
    }

    public String getDeptleader() {
        return deptleader;
    }

    public void setDeptleader(String deptleader) {
        this.deptleader = deptleader;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("leaveType", getLeaveType())
            .append("reason", getReason())
            .append("applyTime", getApplyTime())
            .append("realityStartTime", getRealityStartTime())
            .append("realityEndTime", getRealityEndTime())
            .toString();
    }
}
