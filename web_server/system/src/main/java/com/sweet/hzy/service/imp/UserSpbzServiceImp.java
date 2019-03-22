package com.sweet.hzy.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sweet.bean.UserSpbz;
import com.sweet.hzy.mapper.UserHomeRelMapper;
import com.sweet.hzy.mapper.UserSpbzMapper;
import com.sweet.hzy.service.UserSpbzService;
import com.sweet.util.ServletUtil;
import com.sweet.util.SysException;

@Service
public class UserSpbzServiceImp implements UserSpbzService {

	@Resource
	private UserSpbzMapper userSpbzMapper;
	
	@Resource
	private UserHomeRelMapper userHomeRelMapper;
	
	@Override
	public List<UserSpbz> getUserSpbzList() {
		return userSpbzMapper.getUserSpbzList(Integer.valueOf(ServletUtil.getSessionVal("id")));
	}

	@Override
	public int getUserSpbzCount() {
		return userSpbzMapper.getUserSpbzCount(Integer.valueOf(ServletUtil.getSessionVal("id")));
	}

	@Override
	@Transactional(rollbackFor=Exception.class,noRollbackFor=SysException.class)
	public int approvalUserHome(Integer id,Integer czlx) throws SysException {
		//该代办信息
		UserSpbz userSpbz = userSpbzMapper.getUserSpbz(id);
		UserSpbz newSpbz = new UserSpbz();
		newSpbz.setId(userSpbz.getId());
		newSpbz.setXbbj(0);
		if(180 == czlx) {//同意
			//删除家庭中此人
			userHomeRelMapper.deleteUserHomeRelByUserid(userSpbz.getUserid());
			newSpbz.setCzlx(180);
			userSpbzMapper.updateUserSpbz(newSpbz);
			return userHomeRelMapper.insertUserHomeRel(userSpbz.getRelateid(),userSpbz.getUserid());
		}else if(181 == czlx) {//拒绝
			newSpbz.setCzlx(181);
			userSpbzMapper.updateUserSpbz(newSpbz);
			return 0;
		}else {
			throw new SysException("操作错误");
		}
	}

}
