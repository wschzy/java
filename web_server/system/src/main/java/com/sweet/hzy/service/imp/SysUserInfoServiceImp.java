package com.sweet.hzy.service.imp;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sweet.bean.SysUserInfo;
import com.sweet.bean.TbForbid;
import com.sweet.hzy.mapper.SysUserInfoMapper;
import com.sweet.hzy.mapper.TbForbidMapper;
import com.sweet.hzy.service.SysUserInfoService;
import com.sweet.util.MD5;
import com.sweet.util.ServletUtil;


@Service
public class SysUserInfoServiceImp implements SysUserInfoService{
	public static final Integer DISABLE_TIMES = 6;
	@Resource
	private SysUserInfoMapper sysUserInfoMapper;
	@Resource
	private TbForbidMapper tbForbidMapper;
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

	public SysUserInfo findUserByLoginidAndPassword(String loginid, String password,HttpSession session) {
		//查询改用户是否被禁用
		TbForbid disRecord = tbForbidMapper.findDisableUserForLoginid(loginid);
		if(disRecord != null) {
			throw new RuntimeException("该账号已经被禁用");
		}
		SysUserInfo user = sysUserInfoMapper.findUserByLoginidAndPassword(loginid, MD5.getMD5(password.getBytes()));
		HttpServletRequest request = ServletUtil.getRequset();
		if(user == null) {
			handlerErrorPassword(loginid, request.getRemoteAddr());
			throw new RuntimeException("账号或者密码错误");
		}else {
			int r = tbForbidMapper.updateTbForbidEnable(loginid);
			if(r > 1) {
				throw new RuntimeException("登录失败");
			}
			session.setAttribute("id", user.getId());
			session.setAttribute("loginid", user.getLoginid());
			session.setAttribute("phone", user.getPhone());
			session.setAttribute("sex", user.getSex());
			session.setAttribute("fullname", user.getFullname());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("lrsj", user.getLrsj());
			session.setAttribute("picture", user.getPicture());
		}
		return user;
	}
	
	public void handlerErrorPassword(String loginid,String ip) {
		TbForbid disRecord = tbForbidMapper.findNotDisableRecordUserForLoginid(loginid);//根据id查询禁用记录
		if(disRecord == null) {
			//不存在禁用记录，插入禁用记录
			tbForbidMapper.insertTbForbid(loginid, 1, null, null, null, ip);
		}else {
			//存在禁用记录
			if(disRecord.getLogintimes() == DISABLE_TIMES) {
				tbForbidMapper.updateTbForbid(disRecord.getId());
				throw new RuntimeException("该账号已经被禁用");
			}else if(disRecord.getLogintimes() < DISABLE_TIMES){
				tbForbidMapper.updateTbForbidTimes(disRecord.getId(), disRecord.getLogintimes()+1);
			}else {
				throw new RuntimeException("该账号已经被禁用");
			}
		}
	}
}







