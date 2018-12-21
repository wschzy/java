package com.sweet.hzy.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sweet.bean.SysUserInfo;
import com.sweet.bean.UserHome;
import com.sweet.hzy.mapper.UserHomeMapper;
import com.sweet.hzy.mapper.UserHomeRelMapper;
import com.sweet.util.ServletUtil;
import com.sweet.util.SysException;
@Service
public class UserHomeServiceImp {
	@Resource
	private UserHomeMapper userHomeMapper;
	
	@Resource
	private UserHomeRelMapper userHomeRelMapper;
	/**
	 * 根据用户id查询home
	 */
	public UserHome getHomeByUserid() throws SysException{
		List<UserHome> home = userHomeMapper.getHomeByUserid(Integer.valueOf(ServletUtil.getSessionVal("id")));
		if(home.size() > 1) {
			throw new SysException("存在多家庭");
		}else if(home.size() == 1){
			return home.get(0);
		}
		return null;
	}
	
	/**
	 * 根据homeid查询用户列表
	 */
	public List<SysUserInfo> getUserListByHomeid(Integer homeid){
		return userHomeMapper.getUserListByHomeid(homeid);
	}
	
	/**
	 * 添加home
	 */
	@Transactional(rollbackFor=Exception.class,noRollbackFor=SysException.class)
	public int insertHome(UserHome home) throws SysException {
		//查询是否存在home
		UserHome userHome = getHomeByUserid();
		if(userHome != null) {
			throw new SysException("已存在家庭");
		}else {
			int i = userHomeMapper.insertHome(home);
			userHomeRelMapper.insertUserHomeRel(home.getId(), Integer.parseInt(ServletUtil.getSessionVal( "id")));
			return i;
		}
	}
	
	
}
