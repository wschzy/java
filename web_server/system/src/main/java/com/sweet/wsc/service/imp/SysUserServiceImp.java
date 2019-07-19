package com.sweet.wsc.service.imp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sweet.hzy.mapper.SysUserInfoMapper;
import com.sweet.util.MD5;
import com.sweet.wsc.mapper.SysUserMapper;
import com.sweet.wsc.service.SysUserService;

@Deprecated
@Service
public class SysUserServiceImp implements SysUserService{

	@Resource
	private SysUserMapper sysUserMapper;
	@Resource
	private SysUserInfoMapper sysUserInfoMapper;
	@Transactional
	public int addUser(String loginid, String password, String phone, Integer sex) {
		 sysUserMapper.addUser(loginid, MD5.getMD5(password.getBytes()), phone, sex);
		 //sysUserInfoMapper.addUser(loginid, MD5.getMD5(password.getBytes()), phone, sex, phone, "");
		 return 1/sex;
	}

	
}
