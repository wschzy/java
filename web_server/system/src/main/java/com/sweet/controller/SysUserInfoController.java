package com.sweet.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sweet.service.SysUserInfoService;


@RestController
@RequestMapping(value="/SysUserInfo")
public class SysUserInfoController {

	@Resource
	SysUserInfoService sysUserInfoService;
	
	@Value("${server.port}")
	private String port;
	
	@RequestMapping(value="/addUser.do")
	public int addUser(String loginid,String password,String phone,Integer sex) {
		return sysUserInfoService.addUser(loginid, password, phone, sex);
	}
}
