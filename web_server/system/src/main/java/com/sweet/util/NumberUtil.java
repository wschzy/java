package com.sweet.util;
import java.text.DecimalFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class NumberUtil {

    public static boolean isNumber(String number) {
    	boolean result = false;
    	if(StringUtil.isNotEmpty(number)){
    		Pattern p = Pattern.compile("^-?[1-9]\\d*$");
    		Matcher m = p.matcher(number);
    		result = m.matches(); 
    	}else{
    		result = true;
    	}
    	
    	return result;
    }
    
    /**
     * 数值的校验(0-9)、返回true或false
     */
    public static boolean checkNumberValid(String number) {
        number = StringUtil.nvl(number);
        if ("".equals(number)) {
            return false;
        }
        boolean bDot = false; // 判断是否为'.'
        int nChar;
        for (int i = 0; i < number.length(); i++) {
            nChar = number.charAt(i);
            if (nChar == '-' && i == 0) {
                continue;
            } else if (nChar == '-' && i != 0) {
                return false;
            }
            if (nChar > '9') {
                return false;
            }
            if ((nChar < '0') && (nChar != ',') && (nChar != '.')) {
                return false;
            }
            // 如果是'.'
            if (nChar == '.') {
                // 判断是否为'.'，是返回true，其他返回false
                if (!bDot) {
                    bDot = true;
                    continue;
                } else {
                    return false;
                }
            }
        }
        return true;
    }

    /**
     * 数字的检查
     * 
     * @param s
     *            数字的字符串
     * @return boolean 2003/11/06 
     */
    public static boolean checkIntNumberValid(String s) {
        if (s == null || s.length() == 0) {
            return false;
        }
        for (int i = 0, j = s.length(); i < j; i++) {
            if (s.charAt(i) < '0' || s.charAt(i) > '9') {
                return false;
            }
        }
        return true;
    }

    /**
     * String转Int
     * 
     * @param str
     *            字符串
     * @return int 返回值 2003/11/07
     */
    public static int convertToInt(String str) {
        int result = -1;
        try {
            str = str.trim();
            result = Integer.parseInt(str);
        } catch (Exception ex) {
        }
        return result;
    }
    
    public static int convertToInt(Object str) {
        int result = -1;
        String newStr = StringUtil.getString(str);
        try {
        	newStr = newStr.trim();
            result = Integer.parseInt(newStr);
        } catch (Exception ex) {
        }
        return result;
    }

    /**
     * String转Long
     * 
     * @param str
     *            字符串
     * @return Long 返回值 2003/11/07
     */
    public static long convertToLong(String str) {
        long result = 0;
        try {
            str = str.trim();
            result = Long.parseLong(str);
        } catch (Exception ex) {

        }
        return result;
    }

    /**
     * String转Float
     * 
     * @param str
     *            文字列
     * @return Float 返回值 2003/11/07
     */
    public static float convertToFloat(String str) {
        float result = 0;
        try {
            str = str.trim();
            result = Float.parseFloat(str);
        } catch (Exception ex) {

        }
        return result;
    }

    /**
     * String转Int
     * 
     * @param value
     *            字符串
     * @param flag
     *            转换标志： true : value为null或者是空字符串、抛Exception异常  false : value为null或者是空字符串、返回0
     * @return int 返回值
     */
    public static int parseInt(String value, boolean flag) throws Exception {
        if (flag) {
            if (value == null || "".equals(value.trim())) {
                throw new Exception("FW077");
            }
        } else {
            if (value == null || "".equals(value.trim())) {
                return 0;
            }
        }
        try {
            return Integer.parseInt(value.trim());
        } catch (NumberFormatException ex) {
            if (flag) {
                throw new Exception("FW077");
            } else {
                return 0;
            }
        }
    }


    /**
     * 字符串数组转换为整型数组
     */
    public static Integer[] strArr2IntArr(String[] strArr) {
        Integer[] intArr = new Integer[strArr.length];

        for (int i = 0; i < strArr.length; i++) {
            intArr[i] = convertToInt(strArr[i]);
        }

        return intArr;
    }

    /**
     * l为null时返回0L
     * 
     * @param l
     *            长整型对象
     * @return 长整型值
     */
    public static long NVL(Long l) {
        if (l == null) {
            return 0L;
        }

        return l.longValue();
    }

    /**
     * i为null时返回0
     * 
     * @param i
     *            整形对象
     * @return 整形值
     */
    public static int NVL(Integer i) {
        if (i == null) {
            return 0;
        }

        return i.intValue();
    }
    
    /**
     * 格式化指定数值(,##0.00)
     * @param value
     * @return 结果
     */
    public static String formatCurrency(Double value){
    	String result = "0.00";
    	if (value != null)
    		result = new DecimalFormat(",##0.00").format(value);
    	return result;
    }
    
    /**
     * 格式化指定数值(,##0)
     * @param value
     * @return 结果
     */
    public static String formatInteger(Double value){
    	String result = "0";
    	if (value != null)
    		result = new DecimalFormat(",##0").format(value);
    	return result;
    }
    
    
}

