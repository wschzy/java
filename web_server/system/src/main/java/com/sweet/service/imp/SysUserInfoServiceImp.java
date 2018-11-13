package com.sweet.service.imp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sweet.mapper.SysUserInfoMapper;
import com.sweet.service.SysUserInfoService;
import com.sweet.util.MD5;


@Service
public class SysUserInfoServiceImp implements SysUserInfoService{

	@Resource
	private SysUserInfoMapper sysUserInfoMapper;
	
	@Transactional
	public int addUser(String loginid, String password, String phone, Integer sex) {
		//MD5º”√‹
		return sysUserInfoMapper.addUser(loginid, MD5.getMD5(password.getBytes()), phone, sex);
	}

	
}
