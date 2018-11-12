package com.sweet.service.imp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sweet.mapper.SysUserInfoMapper;
import com.sweet.service.SysUserInfoService;


@Service
public class SysUserInfoServiceImp implements SysUserInfoService{

	@Resource
	private SysUserInfoMapper sysUserInfoMapper;
	
	@Transactional
	public int addUser(String loginid, String password, String phone, Integer sex) {
		return sysUserInfoMapper.addUser(loginid, password, phone, sex);
	}

	
}
