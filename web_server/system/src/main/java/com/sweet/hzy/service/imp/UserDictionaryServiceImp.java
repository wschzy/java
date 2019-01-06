package com.sweet.hzy.service.imp;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.sweet.bean.UserDictionary;
import com.sweet.hzy.mapper.UserDictionaryMapper;
import com.sweet.hzy.service.UserDictionaryService;
import com.sweet.util.ServletUtil;
@Service
public class UserDictionaryServiceImp implements UserDictionaryService {

	@Resource
	private UserDictionaryMapper userDictionaryMapper;
	
	public List<UserDictionary>getDictionaryList(){
		return userDictionaryMapper.getDictionaryList(Integer.valueOf(ServletUtil.getSessionVal("id")));
	}
	
	public int insertDictionary(UserDictionary dic) {
		dic.setUserid(Integer.valueOf(ServletUtil.getSessionVal("id")));//设置该用户
		return userDictionaryMapper.insertDictionary(dic);
	}
	
	public int updateDictionary(UserDictionary dic) {
		return userDictionaryMapper.updateDictionary(dic);
	}
	
	public int deleteDictionaryById(Integer id) {
		return userDictionaryMapper.deleteDictionaryById(id);
	}
}
