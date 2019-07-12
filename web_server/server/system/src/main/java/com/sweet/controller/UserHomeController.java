package com.sweet.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.web.bind.annotation.*;

import com.sweet.bean.SysUserInfo;
import com.sweet.bean.UserHome;
import com.sweet.hzy.service.UserHomeService;
import com.sweet.util.SysException;

@RestController
@RequestMapping(value="/home")
public class UserHomeController extends BaseController{

	@Resource
	private UserHomeService userHomeService;
	
	@GetMapping(value="/getHome")
	public UserHome getHomeByUserid() throws SysException {
		return userHomeService.getHomeByUserid();
	}
	
	@GetMapping(value="/getUserList")
	public List<SysUserInfo> getUserListByHomeid() throws SysException{
		return userHomeService.getUserListByHomeid();
	}
	
	@PostMapping(value="/addHome")
	public int addHome(@Valid UserHome home) throws SysException {
		return userHomeService.addHome(home);
	}
	
	@PostMapping(value="/addUser")
	public int addUserForHome (@NotNull(message = "被邀请人不能为空")String loginid) throws SysException{
		return userHomeService.addUserForHome(loginid);
	}
	
	@DeleteMapping(value="/deleteUser/{userid}")
	public int deleteUserForHome (@NotNull(message = "参数不能为空")@PathVariable Integer userid) throws SysException{
		return userHomeService.deleteUserForHome(userid);
	}
}






