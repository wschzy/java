package com.sweet.hzy.service.imp;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.sweet.bean.UserDictionary;
import com.sweet.hzy.mapper.UserDictionaryMapper;
import com.sweet.hzy.service.UserDictionaryService;
import com.sweet.util.ServletUtil;
import com.sweet.util.StringUtil;
import com.sweet.util.SysException;
@Service
public class UserDictionaryServiceImp implements UserDictionaryService {

	@Resource
	private UserDictionaryMapper userDictionaryMapper;
	
	@Override
	public List<UserDictionary>getDictionaryList(){
		return userDictionaryMapper.getDictionaryList(Integer.valueOf(ServletUtil.getSessionVal("id")));
	}
	
	@Override
	public int insertDictionary(UserDictionary dic) {
		if(StringUtil.isEmpty(ServletUtil.getSessionVal("isadmin"))){
			dic.setUserid(Integer.valueOf(ServletUtil.getSessionVal("id")));//设置该用户
		}
		return userDictionaryMapper.insertDictionary(dic);
	}
	
	@Override
	public int updateDictionary(UserDictionary dic) {
		return userDictionaryMapper.updateDictionary(dic);
	}
	
	@Override
	public int deleteDictionaryById(Integer id) throws SysException {
		int param = userDictionaryMapper.inPayByid(id);
		if(0 != param) {
			throw new SysException("已经存在支付中，不能删除");
		}
		return userDictionaryMapper.deleteDictionaryById(id);
	}

	@Override
	public List<UserDictionary> getPayWayList() {
		return userDictionaryMapper.getPayWayList();
	}
}
