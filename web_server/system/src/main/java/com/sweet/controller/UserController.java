package com.sweet.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.sweet.service.UserService;


@RestController
public class UserController {

	@Resource
	UserService userService;
	
	@Value("${server.port}")
	private String port;
	
	@RequestMapping(method=RequestMethod.POST,value="/login.do")
	public String loginController(String a) {
		String str = userService.login();
		return str;
	}
}
