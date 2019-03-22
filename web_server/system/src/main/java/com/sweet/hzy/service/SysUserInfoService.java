package com.sweet.hzy.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import com.sweet.bean.SysUserInfo;
import com.sweet.util.SysException;

public interface SysUserInfoService {
	int addUser(SysUserInfo user)throws SysException;
	Map<String,Object> findUserList(Integer page, Integer pageSize);
	SysUserInfo findUserByLoginidAndPassword (String loginid,String password,HttpSession session)throws SysException;
	List<?> getMenu();
	int updateUserPictureById(String picture);
	SysUserInfo findUserByid(Integer id);
	int deleteUserById(Integer id);
	int updateUserById(SysUserInfo user);
}
