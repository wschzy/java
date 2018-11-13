package com.sweet.util;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
@SuppressWarnings("rawtypes")
public class ListUtil {

	public static List<String> strToList(String str){
		return strToList(str, ",");
	}
	
	/**
	  * isEmpty(判断是否为空)
	 */
	public static boolean isEmpty(Collection list){
		return !isNotEmpty(list);
	}
	
	/**
	  * isEmpty(判断是否为空)
	 */
	public static boolean isEmpty(Object[] arr){
		return !isNotEmpty(arr);
	}
	
	/**
	  * isNotEmpty(判断是否不为空)
	 */
	public static boolean isNotEmpty(Collection list){
		if(list!=null && list.size()>0)
			return true;
		else
			return false;
	}
	
	public static boolean isNotEmpty(Map map){
		if(map!=null && map.size()>0)
			return true;
		else
			return false;
	}
	
	public static boolean isEmpty(Map map){
		return !isNotEmpty(map);
	}
	
	//isNotEmpty(判断是否不为空)
	public static boolean isNotEmpty(Object[] arr){
		if(arr!=null && arr.length>0)
			return true;
		else
			return false;
	}
	
	/**
	  * strToList(将字符串按 regex 分割，组成list返回)
	 */
	static List<String> strToList(String str, String regex){
		List<String> list = new ArrayList<String>();
		
		if(StringUtil.isEmpty(str)){
			return list;
		}
		String[] strArr = str.split(regex);
		
		for(String eachStr : strArr){
			list.add(eachStr);
		}
		return list;
	}
	
	
	public static String listToStr(List<String> list, String joinChar){
		if(isEmpty(list) || joinChar == null){
			return "";
		}
		String listStr = "";
		for(String item : list){
			listStr = listStr+item+joinChar;
		}
		listStr = listStr.substring(0, listStr.length()- joinChar.length());
		return listStr;
		
	}
}
