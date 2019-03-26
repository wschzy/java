package com.sweet.hzy.service.imp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
/*
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;*/
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sweet.bean.SysUserInfo;
import com.sweet.bean.TbForbid;
import com.sweet.hzy.mapper.SysMenuMapper;
import com.sweet.hzy.mapper.SysUserInfoMapper;
import com.sweet.hzy.mapper.TbForbidMapper;
import com.sweet.hzy.mapper.UserMenuMapper;
import com.sweet.hzy.service.SysUserInfoService;
import com.sweet.util.MD5;
import com.sweet.util.ServletUtil;
import com.sweet.util.StringUtil;
import com.sweet.util.SysException;


@Service
public class SysUserInfoServiceImp implements SysUserInfoService{
	private static final Integer DISABLE_TIMES = 6;
	@Resource
	private SysUserInfoMapper sysUserInfoMapper;
	@Resource
	private TbForbidMapper tbForbidMapper;
	@Resource
	private SysMenuMapper sysMenuMapper;
	@Resource
	private UserMenuMapper userMenuMapper;
	/*
	@Resource
    RedisTemplate redisTemplate;

	@Resource
    StringRedisTemplate stringRedisTemplate;*/
	
	@Transactional(rollbackFor=Exception.class,noRollbackFor=SysException.class)
	public int addUser(SysUserInfo user)throws SysException{
		user.setPassword(MD5.getMD5(user.getPassword().getBytes()));
		if(sysUserInfoMapper.findUserByLoginid(user.getLoginid()) == null) {
			return sysUserInfoMapper.addUser(user);
		}else {
			throw new SysException("该用户已经注册");
		}
	}

	public Map<String,Object> findUserList(Integer page,Integer pageSize) {
		page = page == null ? 1 : page;
		pageSize = pageSize == null ? 8 : pageSize;
		PageHelper.startPage(page,pageSize);
		List<SysUserInfo> list = sysUserInfoMapper.findUserList();
		PageInfo<SysUserInfo> pageInfoSysUserInfoList = new PageInfo<SysUserInfo>(list);
		Map<String,Object> map = new HashMap();
		map.put("list",pageInfoSysUserInfoList.getList());
		map.put("count",sysUserInfoMapper.findUserCount());
		return map;
	}

	@Transactional(rollbackFor=Exception.class,noRollbackFor=SysException.class)
	public SysUserInfo findUserByLoginidAndPassword(String loginid, String password,HttpSession session) throws SysException {
		//查询改用户是否被禁用
		TbForbid disRecord = tbForbidMapper.findDisableUserForLoginid(loginid);
		if(disRecord != null) {
			throw new SysException("该账号已经被禁用");
		}
		SysUserInfo user = sysUserInfoMapper.findUserByLoginid(loginid);
		HttpServletRequest request = ServletUtil.getRequset();
		if(user == null) {
			throw new SysException("用户名不存在");
		}else {
			if(!MD5.getMD5(password.getBytes()).equals(user.getPassword())){//密码错误
				handlerErrorPassword(loginid, request.getRemoteAddr());
				throw new SysException("账号或者密码错误");
			}
			int r = tbForbidMapper.updateTbForbidEnable(loginid);
			if(r > 1) {
				throw new SysException("登录失败");
			}
			session.setAttribute("id", user.getId());
			session.setAttribute("loginid", user.getLoginid());
			session.setAttribute("isadmin", user.getIsadmin());
		}
		user.setPassword(null);
		return user;
	}
	
	private void handlerErrorPassword(String loginid,String ip) throws SysException{
		TbForbid disRecord = tbForbidMapper.findNotDisableRecordUserForLoginid(loginid);//根据id查询禁用记录
		if(disRecord == null) {
			//不存在禁用记录，插入禁用记录
			tbForbidMapper.insertTbForbid(loginid, 1, null, null, null, ip);
		}else {
			//存在禁用记录
			if(disRecord.getLogintimes() == DISABLE_TIMES) {
				tbForbidMapper.updateTbForbid(disRecord.getId());
				throw new SysException("该账号已经被禁用");
			}else if(disRecord.getLogintimes() < DISABLE_TIMES){
				tbForbidMapper.updateTbForbidTimes(disRecord.getId(), disRecord.getLogintimes()+1);
			}else {
				throw new SysException("该账号已经被禁用");
			}
		}
	}
	
	
	//获取用户的菜单权限
	public List<?> getMenu() {
		String isadmin = ServletUtil.getSessionVal("isadmin");
		if(StringUtil.isEmpty(isadmin)) {
			List<?> list = userMenuMapper.getMenuList();
			/*redisTemplate.opsForList().leftPush("USER_MENU", JSON.toJSONString(list));
	        stringRedisTemplate.opsForValue().set("USER_MENU_2", JSON.toJSONString(list));*/
	        return list;
		}else {
			return sysMenuMapper.getMenuList();
		}
	}

	//修改用户头像
	public int updateUserPictureById(String picture) {
		return sysUserInfoMapper.updateUserPictureById(picture,Integer.parseInt(ServletUtil.getSessionVal("id")));
	}

	public SysUserInfo findUserByid(Integer id) {
		return sysUserInfoMapper.findUserByid(id);
	}

	@Override
	public int deleteUserById(Integer id) {
		return sysUserInfoMapper.deleteUserById(id);
	}

	@Override
	public int updateUserById(SysUserInfo user) {
		return sysUserInfoMapper.updateUserById(user);
	}

}







