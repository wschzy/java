package com.sweet.hzy.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sweet.bean.SysUserInfo;
import com.sweet.bean.UserHome;
import com.sweet.hzy.mapper.SysUserInfoMapper;
import com.sweet.hzy.mapper.UserHomeMapper;
import com.sweet.hzy.mapper.UserHomeRelMapper;
import com.sweet.hzy.service.UserHomeService;
import com.sweet.util.ServletUtil;
import com.sweet.util.SysException;
@Service
public class UserHomeServiceImp implements UserHomeService{
	@Resource
	private UserHomeMapper userHomeMapper;
	
	@Resource
	private UserHomeRelMapper userHomeRelMapper;
	
	@Resource
	private SysUserInfoMapper sysUserInfoMapper;
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
	 * @throws SysException 
	 */
	public List<SysUserInfo> getUserListByHomeid() throws SysException{
		return userHomeMapper.getUserListByHomeid(getHomeByUserid().getId());
	}
	
	/**
	 * 添加home
	 */
	@Transactional(rollbackFor=Exception.class,noRollbackFor=SysException.class)
	public int addHome(UserHome home) throws SysException {
		//查询是否存在home
		UserHome userHome = getHomeByUserid();
		if(userHome != null) {
			throw new SysException("已存在家庭");
		}else {
			int i = userHomeMapper.insertHome(home);
			//添加home时，将改用户添加到此home
			userHomeRelMapper.insertUserHomeRel(home.getId(), Integer.parseInt(ServletUtil.getSessionVal( "id")));
			return i;
		}
	}
	
	/**
	 * 添加home中的人员
	 */
	@Transactional(rollbackFor=Exception.class,noRollbackFor=SysException.class)
	public int addUserForHome (String loginid) throws SysException {
		SysUserInfo user = sysUserInfoMapper.findUserByLoginid(loginid);
		//删除该用户拥有的家庭
		if(user == null)
			throw new SysException("不存在改用户");
		userHomeRelMapper.deleteUserHomeRelByUserid(user.getId());
		return userHomeRelMapper.insertUserHomeRel(getHomeByUserid().getId(), user.getId());
	}

	@Transactional(rollbackFor=Exception.class,noRollbackFor=SysException.class)
	public int deleteUserForHome(Integer userid) {
		return userHomeRelMapper.deleteUserHomeRelByUserid(userid);
	}

	public int updateHomePictureById(String picture,Integer id) {
		return userHomeMapper.updateHomePictureById(picture,id);
	}

	 
}






