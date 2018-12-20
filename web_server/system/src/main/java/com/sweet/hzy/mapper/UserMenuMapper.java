package com.sweet.hzy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sweet.bean.UserMenu;
/**
 *用户菜单
 */
public interface UserMenuMapper {
	
	@Select("SELECT * FROM USER_MENU ")
	List<UserMenu>getMenuList();
}
