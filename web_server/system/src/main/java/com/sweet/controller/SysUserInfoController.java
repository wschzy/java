package com.sweet.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.github.pagehelper.PageInfo;
import com.sweet.bean.SysUserInfo;
import com.sweet.hzy.service.SysUserInfoService;
import com.sweet.util.ServletUtil;
import com.sweet.util.SysException;


@RestController
@RequestMapping(value="/SysUserInfo")
public class SysUserInfoController extends BaseController {

	@Resource
	private SysUserInfoService sysUserInfoService;
	
	@Value("${server.port}")
	private String port;
	//添加用户
	@PostMapping(value="/addUser")
	public int addUser(String loginid,String password,String phone,Integer sex,String fullname,String email,String picture)throws SysException{
		return sysUserInfoService.addUser(loginid, password, phone, sex, picture, picture, picture);
	}
	
	//登录
	@PostMapping(value="/findUser")
	public SysUserInfo findUserByLoginidAndPassword(@Valid SysUserInfo user) throws SysException{
		return sysUserInfoService.findUserByLoginidAndPassword(user.getLoginid(), user.getPassword(),ServletUtil.getSession());
	}
	
	//查询用户列表
	@PostMapping(value="/allUser.do")
	public PageInfo<SysUserInfo> findUserList(Integer page,Integer pageSize) {
		return sysUserInfoService.findUserList(page,pageSize);
	}
	
	
	//获取用户的菜单权限
	@PostMapping(value="/getMenu.do")
	public List<?> getMenu(){
		return sysUserInfoService.getMenu();
	}
	
	//注销用户
	@RequestMapping("/logout.do")
	public void logout() {
		ServletUtil.getSession().invalidate();
	}
}

/*//多事务
	@Resource
	SysUserService sysUserService;
	@RequestMapping(value="/addUser2")
	public int addUserw(String loginid,String password,String phone,Integer sex) {
		return sysUserService.addUser(loginid, password, phone, sex);
	}*/