package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Meeting;

/**
 * 会议Mapper接口
 * 
 * @author shenzhanwang
 * @date 2022-05-30
 */
public interface MeetingMapper 
{
    /**
     * 查询会议
     * 
     * @param id 会议主键
     * @return 会议
     */
    public Meeting selectMeetingById(Long id);

    /**
     * 查询会议列表
     * 
     * @param meeting 会议
     * @return 会议集合
     */
    public List<Meeting> selectMeetingList(Meeting meeting);

    /**
     * 新增会议
     * 
     * @param meeting 会议
     * @return 结果
     */
    public int insertMeeting(Meeting meeting);

    /**
     * 修改会议
     * 
     * @param meeting 会议
     * @return 结果
     */
    public int updateMeeting(Meeting meeting);

    /**
     * 删除会议
     * 
     * @param id 会议主键
     * @return 结果
     */
    public int deleteMeetingById(Long id);

    /**
     * 批量删除会议
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMeetingByIds(String[] ids);
}
