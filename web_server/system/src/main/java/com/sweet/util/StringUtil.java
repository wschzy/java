package com.sweet.util;


import groovy.lang.GroovyShell;

public class StringUtil {
	private StringUtil() {
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