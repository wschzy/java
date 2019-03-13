package com.sweet.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sweet.bean.UserSpbz;
import com.sweet.hzy.service.UserSpbzService;
import com.sweet.util.SysException;

@RestController
@RequestMapping(value="/userspbz")
public class UserSpbzController extends BaseController{

	@Resource
	private UserSpbzService userSpbzService;
	
	@PostMapping(value="/getUserSpbzList.do")
	public List<UserSpbz> getUserSpbzList() {
		return userSpbzService.getUserSpbzList();
	}
	
	@PostMapping(value="/getUserSpbzCount.do")
	public int getUserSpbzCount() {
		return userSpbzService.getUserSpbzCount();
	}
	
	@PostMapping(value="/approvalUserHome.do")
	public int approvalUserHome(Integer id,Integer approval) throws SysException {
		return userSpbzService.approvalUserHome(id,approval);
	}
}
