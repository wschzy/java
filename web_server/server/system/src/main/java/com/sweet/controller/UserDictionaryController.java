package com.sweet.controller;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.web.bind.annotation.*;

import com.sweet.bean.UserDictionary;
import com.sweet.hzy.service.UserDictionaryService;
import com.sweet.util.SysException;

@RestController
@RequestMapping(value="/category")
public class UserDictionaryController extends BaseController{

	@Resource
	private UserDictionaryService userDictionaryService;
	
	@GetMapping(value="/getUserDictionaryList")
	public List<UserDictionary>getDictionaryList(){
		return userDictionaryService.getDictionaryList();
	}
	
	@PostMapping(value="/add")
	public int insertDictionary(@Valid UserDictionary dic) {
		return userDictionaryService.insertDictionary(dic);
	}
	
	@PutMapping(value="/updateUserDictionary")
	public int updateDictionary(@Valid UserDictionary dic) {
		return userDictionaryService.updateDictionary(dic);
	}
	
	@DeleteMapping(value="/delete/{id}")
	public int deleteDictionaryById(@NotNull(message = "参数不能为空") @PathVariable Integer id) throws SysException {
		return userDictionaryService.deleteDictionaryById(id);
	}
	
	@GetMapping(value="/getPayWayList")
	public List<UserDictionary>getPayWayList(){
		return userDictionaryService.getPayWayList();
	}
	
}






