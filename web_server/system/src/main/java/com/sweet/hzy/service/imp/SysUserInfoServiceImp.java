package com.sweet.hzy.service.imp;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sweet.bean.SysUserInfo;
import com.sweet.hzy.mapper.SysUserInfoMapper;
import com.sweet.hzy.service.SysUserInfoService;
import com.sweet.util.MD5;


@Service
public class SysUserInfoServiceImp implements SysUserInfoService{

	@Resource
	private SysUserInfoMapper sysUserInfoMapper;
	
	@Transactional
	public int addUser(String loginid, String password, String phone, Integer sex,String fullname,String email,String picture){
		if(sysUserInfoMapper.findUserByLoginidAndPassword(loginid, MD5.getMD5(password.getBytes())) ==null) {
			return sysUserInfoMapper.addUser(loginid, MD5.getMD5(password.getBytes()), phone, sex, picture, picture, picture);
		}else {
			throw new RuntimeException("该用户已经注册");
		}
	}
	
	public PageInfo<SysUserInfo> findUserList(Integer page,Integer pageSize) {
		page = page == null ? 1 : page;
		pageSize = pageSize == null ? 15 : pageSize;
		PageHelper.startPage(page,pageSize);
		List<SysUserInfo> list = sysUserInfoMapper.findUserList();
		PageInfo<SysUserInfo> pageInfoSysUserInfoList = new PageInfo<SysUserInfo>(list);
		return pageInfoSysUserInfoList;
	}

	public SysUserInfo findUserByLoginidAndPassword(String loginid, String password) {
		SysUserInfo user = sysUserInfoMapper.findUserByLoginidAndPassword(loginid, MD5.getMD5(password.getBytes()));
		if(user == null) {
			throw new RuntimeException("未找到改用户");
		}
		return user;
	}
	
}
