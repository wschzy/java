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
	
	public static boolean isEmpty(Collection list){
		return !isNotEmpty(list);
	}
	
	public static boolean isEmpty(Object[] arr){
		return !isNotEmpty(arr);
	}
	
	public static boolean isNotEmpty(Collection list){
        return list != null && list.size() > 0;
	}
	
	public static boolean isNotEmpty(Map map){
        return map != null && map.size() > 0;
	}
	
	public static boolean isEmpty(Map map){
		return !isNotEmpty(map);
	}
	
	public static boolean isNotEmpty(Object[] arr){
        return arr != null && arr.length > 0;
	}
	
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
