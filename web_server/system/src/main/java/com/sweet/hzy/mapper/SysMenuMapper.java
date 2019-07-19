package com.sweet.hzy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Select;

import com.sweet.bean.SysMenu;
/**
 *中心菜单 
 */
@CacheNamespace(implementation=com.sweet.redis.RedisCache.class)
public interface SysMenuMapper {
	
	@Select("SELECT * FROM SYS_MENU ")
	List<SysMenu>getMenuList();
}
