package com.sweet.hzy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sweet.bean.SysMenu;
/**
 *中心菜单 
 */
public interface SysMenuMapper {
	
	@Select("SELECT * FROM SYS_MENU ")
	List<SysMenu>findMenuList();
}
