package com.sweet.hzy.service;

import java.util.List;
import com.sweet.bean.UserDictionary;
import com.sweet.util.SysException;

public interface UserDictionaryService {

	List<UserDictionary>getDictionaryList();
	
	List<UserDictionary>getPayWayList();
	
	int insertDictionary(UserDictionary dic);
	
	int updateDictionary(UserDictionary dic);
	
	int deleteDictionaryById(Integer id)throws SysException;
}
