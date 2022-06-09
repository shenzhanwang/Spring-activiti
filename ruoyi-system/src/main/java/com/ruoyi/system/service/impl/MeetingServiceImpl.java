package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import com.ruoyi.system.mapper.PurchaseMapper;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MeetingMapper;
import com.ruoyi.system.domain.Meeting;
import com.ruoyi.system.service.IMeetingService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 会议Service业务层处理
 * 
 * @author shenzhanwang
 * @date 2022-05-30
 */
@Service
@Transactional
public class MeetingServiceImpl implements IMeetingService 
{
    @Autowired
    private MeetingMapper meetingMapper;

    @Autowired
    private PurchaseMapper purchaseMapper;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;

    @Resource
    IdentityService identityService;

    /**
     * 查询会议
     * 
     * @param id 会议主键
     * @return 会议
     */
    @Override
    public Meeting selectMeetingById(Long id)
    {
        return meetingMapper.selectMeetingById(id);
    }

    /**
     * 查询会议列表
     * 
     * @param meeting 会议
     * @return 会议
     */
    @Override
    public List<Meeting> selectMeetingList(Meeting meeting)
    {
        return meetingMapper.selectMeetingList(meeting);
    }

    /**
     * 新增会议
     * 
     * @param meeting 会议
     * @return 结果
     */
    @Override
    public int insertMeeting(Meeting meeting)
    {
        int row = meetingMapper.insertMeeting(meeting);
        // 启动会议流程
        identityService.setAuthenticatedUserId(meeting.getHost());
        HashMap<String, Object> variables = new HashMap<>();
        variables.put("host", meeting.getHost());
        String[] person = meeting.getPeoplelist().split(",");
        variables.put("people", Arrays.asList(person));
        runtimeService.startProcessInstanceByKey("meeting", String.valueOf(meeting.getId()), variables);
        return row;
    }

    /**
     * 修改会议
     * 
     * @param meeting 会议
     * @return 结果
     */
    @Override
    public int updateMeeting(Meeting meeting)
    {
        return meetingMapper.updateMeeting(meeting);
    }

    /**
     * 批量删除会议
     * 
     * @param ids 需要删除的会议主键
     * @return 结果
     */
    @Override
    public int deleteMeetingByIds(String ids)
    {
        String[] keys = Convert.toStrArray(ids);
        for (String key : keys) {
            ProcessInstance process = runtimeService.createProcessInstanceQuery().processDefinitionKey("meeting").processInstanceBusinessKey(key).singleResult();
            try {
                runtimeService.deleteProcessInstance(process.getId(),"删除");
            } catch (Exception e) {
                e.printStackTrace();
            }
            meetingMapper.deleteMeetingByIds(Convert.toStrArray(ids));
        }
        return keys.length;
    }

    /**
     * 删除会议信息
     * 
     * @param id 会议主键
     * @return 结果
     */
    @Override
    public int deleteMeetingById(Long id)
    {
        return meetingMapper.deleteMeetingById(id);
    }
}
