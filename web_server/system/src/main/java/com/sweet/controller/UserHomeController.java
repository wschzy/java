package com.sweet.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sweet.bean.SysUserInfo;
import com.sweet.bean.UserHome;
import com.sweet.hzy.service.UserHomeService;
import com.sweet.util.SysException;

@RestController
@RequestMapping(value="/home")
public class UserHomeController extends BaseController{

	@Resource
	private UserHomeService userHomeService;
	
	@PostMapping(value="/getHome.do")
	public UserHome getHomeByUserid() throws SysException {
		return userHomeService.getHomeByUserid();
	}
	
	@PostMapping(value="/getUserList.do")
	public List<SysUserInfo> getUserListByHomeid(@NotNull(message = "参数不能为空")Integer homeid){
		return userHomeService.getUserListByHomeid(homeid);
	}
	
	@PostMapping(value="/addHome.do")
	public int addHome(@Valid UserHome home) throws SysException {
		return userHomeService.addHome(home);
	}
	
	@PostMapping(value="/addUser.do")
	public int addUserForHome (@NotNull(message = "被邀请人不能为空")String loginid,@NotNull(message = "参数不能为空")Integer homeid) {
		return userHomeService.addUserForHome(loginid, homeid);
	}
	
	@PostMapping(value="/deleteUser.do")
	public int deleteUserForHome (@NotNull(message = "参数不能为空")Integer userid) {
		return userHomeService.deleteUserForHome(userid);
	}
}






