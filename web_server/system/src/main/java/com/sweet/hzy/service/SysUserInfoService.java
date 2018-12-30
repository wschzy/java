package com.sweet.hzy.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import com.github.pagehelper.PageInfo;
import com.sweet.bean.SysUserInfo;

public interface SysUserInfoService {
	int addUser(String loginid,String password, String phone, Integer sex,String fullname,String email,String picture)throws Exception;
	PageInfo<SysUserInfo> findUserList(Integer page,Integer pageSize);
	SysUserInfo findUserByLoginidAndPassword (String loginid,String password,HttpSession session)throws Exception;
	List<?> getMenu();
	int updateUserPictureById(String picture);
	SysUserInfo findUserByid(Integer id);
}
