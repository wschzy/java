package com.sweet.hzy.mapper;

import com.sweet.bean.WeChat;
import org.apache.ibatis.annotations.Insert;

public interface WeChatMapper {


    /**
     * type 0 是客服  type 1 是用户
     * 放用户发送给客服的消息
     * @param weChat
     */
    @Insert("INSERT INTO WECHAT(userid,type,time,message) VALUES"
            + "(#{userid}, 1, now(),#{message} )")
    Integer putUserMessage(WeChat weChat);
}
