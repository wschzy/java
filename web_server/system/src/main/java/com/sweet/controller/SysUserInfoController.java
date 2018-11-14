package com.sweet.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sweet.hzy.service.SysUserInfoService;
import com.sweet.wsc.service.SysUserService;


@RestController
@RequestMapping(value="/SysUserInfo")
public class SysUserInfoController {

	@Resource
	SysUserInfoService sysUserInfoService;
	
	@Resource
	SysUserService sysUserService;
	
	@Value("${server.port}")
	private String port;
	
	@RequestMapping(value="/addUser.do")
	public int addUser(String loginid,String password,String phone,Integer sex) {
		return sysUserInfoService.addUser(loginid, password, phone, sex);
	}
	
	@RequestMapping(value="/addUser2.do")
	public int addUserw(String loginid,String password,String phone,Integer sex) {
		return sysUserService.addUser(loginid, password, phone, sex);
	}
}
