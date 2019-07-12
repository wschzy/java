package com.sweet.util;


import groovy.lang.GroovyShell;
import org.springframework.lang.Nullable;

import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Map;
import java.util.Optional;

public class StringUtil {
	private StringUtil() {
	}

	public static boolean isEmpty(@Nullable Object obj) {
		if (obj == null) {
			return true;
		}
		if (obj instanceof Optional) {
			return !((Optional) obj).isPresent();
		}
		if (obj instanceof CharSequence) {
			return ((CharSequence) obj).length() == 0;
		}
		if (obj.getClass().isArray()) {
			return Array.getLength(obj) == 0;
		}
		if (obj instanceof Collection) {
			return ((Collection) obj).isEmpty();
		}
		if (obj instanceof Map) {
			return ((Map) obj).isEmpty();
		}
		return false;
	}

	public static String getSystemDate(){
		return (new SimpleDateFormat("HH-mm-ss").format(System.currentTimeMillis()));
	}

	public static boolean isEmpty(String str) {
		return str == null || str.length() == 0;
	}

	public static boolean isNotEmpty(String str) {
		return !isEmpty(str);
	}
	
	public static boolean evalScript(String script) {
		GroovyShell groovyShell = new GroovyShell();
		return (Boolean) groovyShell.evaluate(script);
	}


	public static boolean isEqual(String s1, String s2) {
		if (s1 == null) {
			s1 = "";
		}
		if (s2 == null) {
			s2 = "";
		}
		return (s1.equals(s2));
	}
	

	public static String nvl(String value) {
		if (value == null) {
			return "";
		} else {
			return value.trim();
		}
	}

	public static String getString(Object obj) {
		if (obj != null) {
			return obj.toString();
		} else {
			return "";
		}
	}

	public static int getInt(Object obj) {
		if (obj != null) {
			return Integer.parseInt(obj.toString());
		} else {
			return 0;
		}
	}

}