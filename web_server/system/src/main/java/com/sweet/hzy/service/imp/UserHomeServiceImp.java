package com.sweet.hzy.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sweet.bean.SysUserInfo;
import com.sweet.bean.UserHome;
import com.sweet.bean.UserSpbz;
import com.sweet.hzy.mapper.SysUserInfoMapper;
import com.sweet.hzy.mapper.UserHomeMapper;
import com.sweet.hzy.mapper.UserHomeRelMapper;
import com.sweet.hzy.mapper.UserSpbzMapper;
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
	
	@Resource
	private UserSpbzMapper userSpbzMapper;
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
		return sysUserInfoMapper.getUserListByHomeid(getHomeByUserid().getId());
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
		if(user == null) throw new SysException("不存在此用户");
		//获取此家庭id
		int homeid = getHomeByUserid().getId();
		int i = userHomeRelMapper.isUserByUserHomeRel(homeid, user.getId());
		if(i != 0) {
			throw new SysException("存在此用户");
		}
		//删除已有代办
		userSpbzMapper.deleteUserSpbz("USER_HOME_REL", user.getId(),homeid);
		UserSpbz userSpbz = new UserSpbz();
		userSpbz.setUserid(user.getId());//代办人
		userSpbz.setRelateid(homeid);//关联人
		userSpbz.setXbbj(1);
		userSpbz.setTaskname("家庭成员申请");
		//邀请人
		SysUserInfo newUser = sysUserInfoMapper.findUserByid(Integer.valueOf(ServletUtil.getSessionVal("id")));
		userSpbz.setTaskdesc("用户名："+newUser.getLoginid()+"，"+"全名："+newUser.getFullname());
		userSpbz.setRelatetable("USER_HOME_REL");
		//插入审批代办
		return userSpbzMapper.addUserSpbz(userSpbz);
	}

	@Transactional(rollbackFor=Exception.class,noRollbackFor=SysException.class)
	public int deleteUserForHome(Integer userid) throws SysException {
		if(Integer.parseInt(ServletUtil.getSessionVal( "id")) == userid) {
			throw new SysException("不能删除本人");
		}
		return userHomeRelMapper.deleteUserHomeRelByUserid(userid);
	}

	public int updateHomePictureById(String picture,Integer id) {
		return userHomeMapper.updateHomePictureById(picture,id);
	}

	 
}






