package com.sweet.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value="/chat")
public class WeChatController {
    //全局用户信息
    private static  Map<String, List<String>> map = new HashMap<String,List<String>>();

    /**
     * 客服获取所有用户的信息
     * @return
     */
    @RequestMapping(value="/getAllUserMessage")
    public Map<String, List<String>> getAllMessage(){
        Map<String, List<String>> maps =map;
        map= new HashMap<String,List<String>>();
        return maps;
    }

    /**
     * 客服获取用户信息
     * @param id 用户主键
     * @return 用户发送的信息
     */
    @RequestMapping(value="/getUserMessage")
    public List<String> getMessage(String id){
        //获取用户信息
        List<String> list = map.get(id);
        map.remove(id);//删除以获取的用户信息
        return list;
    }

    /**
     * 用户发送给客服
     * 存储用户信息
     * @id 用户主键
     * @message 用户发送的信息
     */
    @RequestMapping(value="/putUserMessage")
    public void putMessage(String id,String message){
        //获取用户信息
        List<String> list = map.get(id);
        if(list == null) {
            list = new ArrayList<String>();
            map.put(id,list);
        }
        list.add(message);
    }

    //全局客服信息
    private static Map<String, List<String>> service = new HashMap<String,List<String>>();

    /**
     * 客服发送给用户
     * 存储客服信息
     * @id 发送给用户主键
     * @message 客服发送的信息
     */
    @RequestMapping(value="/putServiceMessage")
    public void putServiceMessage(String id,String message){
        //获取客服信息
        List<String> list = service.get(id);
        if(list == null) {
            list = new ArrayList<String>();
            service.put(id,list);
        }
        list.add(message);
    }

    /**
     * 用户获取客服信息
     * @param id 用户主键
     * @return 客服发送的信息
     */
    @RequestMapping(value="/getServiceMessage")
    public List<String> getServiceMessage(String id){
        //获取用户信息
        List<String> list = service.get(id);
        service.remove(id);//删除以获取的用户信息
        return list;
    }
}
