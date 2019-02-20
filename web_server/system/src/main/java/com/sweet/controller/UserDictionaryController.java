package com.sweet.controller;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sweet.bean.UserDictionary;
import com.sweet.hzy.service.UserDictionaryService;
import com.sweet.util.SysException;

@RestController
@RequestMapping(value="/category")
public class UserDictionaryController extends BaseController{

	@Resource
	private UserDictionaryService userDictionaryService;
	
	@PostMapping(value="/getUserDictionaryList.do")
	public List<UserDictionary>getDictionaryList(){
		return userDictionaryService.getDictionaryList();
	}
	
	@PostMapping(value="/addUserDictionary.do")
	public int insertDictionary(@Valid UserDictionary dic) {
		return userDictionaryService.insertDictionary(dic);
	}
	
	@PostMapping(value="/updateUserDictionary.do")
	public int updateDictionary(@Valid UserDictionary dic) {
		return userDictionaryService.updateDictionary(dic);
	}
	
	@PostMapping(value="/deleteUserDictionary.do")
	public int deleteDictionaryById(@NotNull(message = "参数不能为空") Integer id) throws SysException {
		return userDictionaryService.deleteDictionaryById(id);
	}
	
	@PostMapping(value="/getPayWayList.do")
	public List<UserDictionary>getPayWayList(){
		return userDictionaryService.getPayWayList();
	}
	
}






