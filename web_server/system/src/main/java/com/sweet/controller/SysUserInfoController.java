package com.sweet.controller;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.sweet.bean.SysUserInfo;
import com.sweet.hzy.service.SysUserInfoService;


@RestController
@RequestMapping(value="/SysUserInfo")
public class SysUserInfoController extends BaseController {

	@Resource
	SysUserInfoService sysUserInfoService;
	
	
	@Value("${server.port}")
	private String port;
	//添加用户
	@RequestMapping(value="/addUser.do")
	public int addUser(String loginid,String password,String phone,Integer sex) {
		return sysUserInfoService.addUser(loginid, password, phone, sex);
	}
	
	//添加用户
	@RequestMapping(value="/allUser.do")
	public PageInfo<SysUserInfo> findUserList(Integer page,Integer pageSize) {
		return sysUserInfoService.findUserList(page,pageSize);
	}
	
	/*多事务
	@Resource
	SysUserService sysUserService;
	@RequestMapping(value="/addUser2.do")
	public int addUserw(String loginid,String password,String phone,Integer sex) {
		return sysUserService.addUser(loginid, password, phone, sex);
	}*/
}
