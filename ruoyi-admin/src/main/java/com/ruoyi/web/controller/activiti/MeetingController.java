package com.ruoyi.web.controller.activiti;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.Meeting;
import com.ruoyi.system.domain.Purchase;
import com.ruoyi.system.service.IMeetingService;
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

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/meeting")
public class MeetingController extends BaseController {

    private String prefix = "activiti/meeting";

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private IMeetingService meetingService;


    @GetMapping()
    public String meeting()
    {
        return prefix + "/meeting";
    }


    /**
     * 查询会议列表
     */
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Meeting meeting)
    {
        startPage();
        List<Meeting> list = meetingService.selectMeetingList(meeting);
        return getDataTable(list);
    }

    /**
     * 导出会议列表
     */
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Meeting meeting)
    {
        List<Meeting> list = meetingService.selectMeetingList(meeting);
        ExcelUtil<Meeting> util = new ExcelUtil<Meeting>(Meeting.class);
        return util.exportExcel(list, "会议数据");
    }

    /**
     * 新增会议
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
     * 新增保存会议
     */
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Meeting meeting)
    {
        return toAjax(meetingService.insertMeeting(meeting));
    }

    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult edit(Meeting meeting)
    {
        return toAjax(meetingService.updateMeeting(meeting));
    }

    /**
     * 删除会议
     */
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(meetingService.deleteMeetingByIds(ids));
    }

    /**
     * 会议签到
     */
    @GetMapping("/signate")
    public String signate(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Meeting apply = meetingService.selectMeetingById(Long.parseLong(p.getBusinessKey()));
            mmap.put("apply", apply);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("startTime", sdf.format(apply.getStartTime()));
            mmap.put("endTime", sdf.format(apply.getEndTime()));
            mmap.put("taskid", taskid);
        }
        return prefix + "/signate";
    }

    /**
     * 填写会议纪要
     */
    @GetMapping("/input")
    public String input(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Meeting apply = meetingService.selectMeetingById(Long.parseLong(p.getBusinessKey()));
            mmap.put("apply", apply);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("startTime", sdf.format(apply.getStartTime()));
            mmap.put("endTime", sdf.format(apply.getEndTime()));
            mmap.put("taskid", taskid);
        }
        return prefix + "/input";
    }
}
