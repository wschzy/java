package com.sweet.controller;

import com.sweet.bean.SysResponse;
import com.sweet.bean.WeChat;
import com.sweet.hzy.service.WeChatService;
import com.sweet.util.SysResponseUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
import javax.validation.Valid;

@RestController
@RequestMapping(value="/chat")
public class WeChatController extends BaseController{

    @Resource
    private WeChatService weChatService;

    @RequestMapping(value="/putUserMessage")
    public SysResponse putUserMessage(@Valid WeChat weChat) {
        return SysResponseUtil.response(weChatService.putUserMessage(weChat));
    }
}
