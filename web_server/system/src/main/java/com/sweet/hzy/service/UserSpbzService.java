package com.sweet.hzy.service;

import java.util.List;

import com.sweet.bean.UserSpbz;
import com.sweet.util.SysException;

public interface UserSpbzService {

	List<UserSpbz> getUserSpbzList();
	
	int getUserSpbzCount();
	
	int approvalUserHome(Integer id,Integer czlx)throws SysException;
}
