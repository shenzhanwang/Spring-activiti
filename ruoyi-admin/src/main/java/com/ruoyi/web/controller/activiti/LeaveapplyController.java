package com.ruoyi.web.controller.activiti;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Leaveapply;
import com.ruoyi.system.service.ILeaveapplyService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.annotation.Resource;

/**
 * 请假Controller
 * 
 * @author shenzhanwang
 * @date 2022-04-02
 */
@Controller
@RequestMapping("/leaveapply")
public class LeaveapplyController extends BaseController
{
    private String prefix = "activiti/leaveapply";

    @Autowired
    private ILeaveapplyService leaveapplyService;

    @Autowired
    private ISysUserService userService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;

    @GetMapping()
    public String leaveapply()
    {
        return prefix + "/leaveapply";
    }

    /**
     * 部门领导审批
     * @return
     */
    @GetMapping("/deptleadercheck")
    public String deptleadercheck(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Leaveapply apply = leaveapplyService.selectLeaveapplyById(Long.parseLong(p.getBusinessKey()));
            mmap.put("apply", apply);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("startTime", sdf.format(apply.getStartTime()));
            mmap.put("endTime", sdf.format(apply.getEndTime()));
            mmap.put("taskid", taskid);
            mmap.put("userlist", userService.selectUserList(new SysUser()));
        }
        return prefix + "/deptleadercheck";
    }

    /**
     * 人事审批
     * @return
     */
    @GetMapping("/hrcheck")
    public String hrcheck(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Leaveapply apply = leaveapplyService.selectLeaveapplyById(Long.parseLong(p.getBusinessKey()));
            mmap.put("apply", apply);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("startTime", sdf.format(apply.getStartTime()));
            mmap.put("endTime", sdf.format(apply.getEndTime()));
            mmap.put("taskid", taskid);
        }
        return prefix + "/hrcheck";
    }

    /**
     * 销假
     * @return
     */
    @GetMapping("/destroyapply")
    public String destroyapply(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Leaveapply apply = leaveapplyService.selectLeaveapplyById(Long.parseLong(p.getBusinessKey()));
            mmap.put("apply", apply);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("startTime", sdf.format(apply.getStartTime()));
            mmap.put("endTime", sdf.format(apply.getEndTime()));
            mmap.put("taskid", taskid);
        }
        return prefix + "/destroyapply";
    }


    /**
     * 调整申请
     * @return
     */
    @GetMapping("/modifyapply")
    public String modifyapply(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Leaveapply apply = leaveapplyService.selectLeaveapplyById(Long.parseLong(p.getBusinessKey()));
            mmap.put("apply", apply);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("startTime", sdf.format(apply.getStartTime()));
            mmap.put("endTime", sdf.format(apply.getEndTime()));
            mmap.put("taskid", taskid);
        }
        return prefix + "/modifyapply";
    }

    /**
     * 查询请假列表
     */
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Leaveapply leaveapply)
    {
        SysUser user = getSysUser();
        String username = user.getLoginName();
        leaveapply.setUserId(username);
        startPage();
        List<Leaveapply> list = leaveapplyService.selectLeaveapplyList(leaveapply);
        return getDataTable(list);
    }

    /**
     * 导出请假列表
     */
    @Log(title = "请假", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Leaveapply leaveapply)
    {
        SysUser user = getSysUser();
        String username = user.getLoginName();
        leaveapply.setUserId(username);
        List<Leaveapply> list = leaveapplyService.selectLeaveapplyList(leaveapply);
        ExcelUtil<Leaveapply> util = new ExcelUtil<Leaveapply>(Leaveapply.class);
        return util.exportExcel(list, "请假数据");
    }

    /**
     * 新增请假
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        SysUser user = getSysUser();
        mmap.put("user", user);
        mmap.put("userlist", userService.selectUserList(new SysUser()));
        return prefix + "/add";
    }

    /**
     * 发起请假流程
     */
    @Log(title = "请假", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Leaveapply leaveapply)
    {
        leaveapply.setApplyTime(new Date());
        return toAjax(leaveapplyService.insertLeaveapply(leaveapply));
    }

    @PostMapping("/update")
    @ResponseBody
    public AjaxResult update(Leaveapply leaveapply)
    {
        return toAjax(leaveapplyService.updateLeaveapply(leaveapply));
    }

    /**
     * 删除请假
     */
    @Log(title = "请假", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(leaveapplyService.deleteLeaveapplyByIds(ids));
    }
}
