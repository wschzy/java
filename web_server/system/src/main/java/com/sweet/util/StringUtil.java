package com.sweet.util;


import java.text.DecimalFormat;
import java.util.List;
import java.util.StringTokenizer;

public class StringUtil {
   private StringUtil() {}
   //j56ha s
   public static String[] str2Array(String str) {
        return str2Array(str, ",");
    }
   public static String[] str2Array(String str, String sep) {
       //
        StringTokenizer token = null;
        String[] array = null;
       if (str == null || sep == null) {
            return null;
        }
       token = new StringTokenizer(str, sep);
        array = new String[token.countTokens()];
        for (int i = 0; token.hasMoreTokens(); i++) {
            array[i] = token.nextToken();
        }
       return array;
    }
   @SuppressWarnings("rawtypes")
   public static boolean isNotEmptyObject(List obj){
    	boolean result = false;
		List list = (List)obj;
		if(ListUtil.isNotEmpty(list)){
			for(Object tmp:list){
				result = isNotEmpty(getString(tmp));
				if(!result)
					break;
			}
			result = true;
		}
		
		return result;
    } 
   public static boolean isNotEmptyObject(String obj){
    	boolean result = false;
    	result = isNotEmpty(getString(obj));
   	return result;
    } 
   public static String array2String(String[] str) {
        int num = 0;
        StringBuffer result = new StringBuffer("");
       if (str == null) {
            return "";
        }
       num = str.length;
        for (int i = 0; i < num; i++) {
            if (str[i] != null) {
                result.append(str[i]);
            }
        }
       return result.toString();
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
   /**
      * zeroToSpace("0"��"00"��"000"�Ŀշ����任)
     */
    public static String zeroToSpace(String s) {
        boolean allZero = true;
       if (s == null) {
            return "";
        }
        s = s.trim();
        if (s.equals("")) {
            return "";
        }
       for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '0') {
                continue;
            } else {
                allZero = false;
                break;
            }
        }
       if (allZero == true) {
            return "";
        } else {
            return s;
        }
    }
   /**
      * addPreZero(�ڶ���ǰ��Ӹ�0)
     */
    public static String addPreZero(Object val, int length) {
        if (val == null) {
            return "";
        }
        String result = val.toString();
        int strLen = result.length();
        if (strLen < length) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < length - strLen; i++) {
                sb.append('0');
            }
            sb.append(val);
            result = sb.toString();
        }
       return result;
    }
   /**
      * decreasePreZero(����ȥ��ǰ���0�����ؽ��)
     */
    public static String decreasePreZero(String number) {
        String result = number;
        // ���Ϊnull���߿��ַ����򷵻�""
        if (number == null || number.trim().equals("")) {
            return "";
        }
        if (number.trim().equals("0") || number.trim().equals("-0")) {
            return "0";
        }
        // ���ú���ֵ���
        if (NumberUtil.checkNumberValid(number) != false) {
            // ���ҽ���ת�������ָ�ʽ
            long numNumber = 0;
            numNumber = Long.parseLong(number);
            result = String.valueOf(numNumber);
        }
        return result;
    }
   /**
      * formatPercentNumber(����906 --> 906%�ĸ�ʽת��)
     */
    public static String formatPercentNumber(String number) {
        // null���߿��ַ���������""
        if (number == null || number.trim().equals("")) {
            return "";
        }
        // ��������ַ�����0��-0������0
        if (number.trim().equals("0") || number.trim().equals("-0")) {
            return "0";
            // �����ַ���������%������
        } else if (NumberUtil.checkNumberValid(number)) {
            return number + "%";
        } else {
            return number.trim();
        }
    }
    //formatRate(����ZZ.ZZ ----> Z9.999�ĸ�ʽת��)
    public static String formatRate(String rate) {
        if (rate == null || "".equals(rate.trim())) {
            return "";
        }
        if (!NumberUtil.checkNumberValid(rate)) {
            return rate.trim();
        } else {
            DecimalFormat rateformat = new DecimalFormat("#,##0.000");
            try {
                double numericrate = Double.parseDouble(rate.trim()) + 0.0000000001;
                rate = rateformat.format(numericrate);
                if ("0.000".equals(rate)) {
                    return " ";
                } else if (rate.substring(rate.length() - 3, rate.length()).equals("000")) {
                    rate = rate.substring(0, rate.length() - 3) + "0";
                } else {
                    while (rate.endsWith("0")) {
                        rate = rate.substring(0, rate.length() - 1);
                    }
                }
            } catch (Exception ex) {

            }
        }
        if (rate != null && !"".equals(rate.trim())) {
            rate = rate + "%";
        }
        return rate;
    }
   /**
      * formatPostNum(���������ʽת��)
     */
    public static String formatPostNum(String[] postNum) {
        if (postNum == null) {
            return "";
        }
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < postNum.length; i++) {
            if (postNum[i] == null || postNum[i].trim().equals("")) {
                return "";
            }
            if (i != 0) {
                result.append("-");
            }
            result.append(postNum[i]);
        }
        return result.toString();
    }
    //formatPostNum(���������ʽת��)
    public static String formatPostNum(String postNum) {
        if (postNum == null || postNum.length() != 7) {
            return postNum;
        }
        return postNum.trim().substring(0, 3) + "-" + postNum.trim().substring(3, 7);
    }
    //formatPostNumToArray(���������ʽת��)
    public static String[] formatPostNumToArray(String postNum) {
        String[] postNumArray = { "", "" };
        if (postNum == null || postNum.length() != 7) {
        } else {
            postNumArray[0] = postNum.trim().substring(0, 3);
            postNumArray[1] = postNum.trim().substring(3, 7);
        }
        return postNumArray;
    }
   /**
     * 
      * trimSpc(ȥ�����ҿո�(��Ǻ�ȫ��))
     */
    public static String trimSpc(String val) {
        if (val == null) {
            return "";
        } else {
            val = val.trim();
        }
        // ��ո�(��Ǻ�ȫ��)���ı���
        int iHead = 0;
        // ��ո�(��Ǻ�ȫ��)���ļ���
        for (int i = 0; i < val.length(); i++) {
            if (val.charAt(i) == ' ' || val.charAt(i) == '��') {
                iHead++;
            } else {
                break;
            }
        }
        // ɾ���ҿո�(��Ǻ�ȫ��)�������ַ���
        String valUse = val.substring(iHead);
        if (null != valUse) {
            int iEnd = valUse.length();
            for (int i = valUse.length() - 1; i >= 0; i--) {
                if (valUse.charAt(i) == ' ' || valUse.charAt(i) == '��') {
                    iEnd--;
                } else {
                    break;
                }
            }
            valUse = valUse.substring(0, iEnd);
        }
        return valUse;
    }
   /**
     * 
      * filteZero(ȫ��0����nullʱ���ؿ��ַ���)
     *
    */
    public static String filteZero(String val) {
        if (val == null || "".equals(val.trim())) {
            return "";
        }
        if (!NumberUtil.checkIntNumberValid(val)) {
            return "";
        }
        val = new Long(val.trim()).toString();
       return val;
    }
   /*
      * nvl(�ַ�������)
    */
    public static String nvl(String value) {
        if (value == null) {
            return "";
        } else {
            return value.trim();
        }
    }
   /**
     * 
      * addBackFullSpace(��������ȫ�ǿո񲢷����ַ���)
     *
    */
    public static String addBackFullSpace(String val, int length) {
        if (val == null) {
            return "";
        }
        int num = length - val.length();
        if (num <= 0) {
            return val;
        }
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < num; i++) {
            result.append("��");
        }
       return val + result.toString();
    }
   /**
     * 
      * replace(�ַ��������в������ַ���)
     *
    */
    public static String replace(String sVal, String oldVal, String repVal) {
        if (sVal == null || oldVal == null || repVal == null) {
            return sVal;
        }
        StringBuffer result = new StringBuffer(sVal);
        String str = sVal;
       int preLength = 0;
        int newEndPost = 0;
        while (str.toString().indexOf(oldVal) >= 0) {
            int startPost = preLength + str.toString().indexOf(oldVal);
            int endPost = startPost + oldVal.length();
           result.delete(startPost, endPost);
            result.insert(startPost, repVal);
           newEndPost = startPost + repVal.length();
            str = result.substring(newEndPost, result.length());
            preLength = newEndPost;
        }
        return result.toString();
    }
    //toNumStr(���ַ����Ŀ�ͷ��ȡ���ֲ���)
    public static String toNumStr(String str) {
        int i = 0;
       if (str == null) {
            return "";
        }
        for (i = 0; i < str.length(); i++) {
            char ch = str.charAt(i);
            if (ch != '.' && (ch < '0' || ch > '9')) {
                break;
            }
        }
        return str.substring(0, i);
    }
   /**
      * listToStringArray(List��String��ת�ַ�������)
     *
    */
    public static String[] listToStringArray(List<String> inputList) {
        return inputList.toArray(new String[inputList.size()]);
    }
   /**
      * listToSQLString(�Զ��ŷָ��List��String��ת��SQLʹ�õ��ַ���)
     *
    */
    public static String listToSQLString(List<String> inputList) {
        StringBuffer output = new StringBuffer();
        for (int i = 0; i < inputList.size(); i++) {
            output.append("'");
            output.append(inputList.get(i));
            output.append("'");
            if (i != inputList.size() - 1) {
                output.append(",");
            }
        }
        return output.toString();
    }
   /**
     * 
      * getHashString(����Hash�ַ���)
     *
    */
    public static String getHashString(byte[] md5Data) {
        StringBuffer hashString = new StringBuffer();
        for (int i = 0; i < md5Data.length; ++i) {
            String hex = Integer.toHexString(md5Data[i]);
            if (hex.length() == 1) {
                hashString.append('0');
                hashString.append(hex.charAt(0));
            } else {
                hashString.append(hex.substring(hex.length() - 2));
            }
        }
        return hashString.toString();
    }
   /**
     * 
      * toHexString(ת��Ϊ16�����ַ���)
     *
    */
    public static String toHexString(byte[] in) {
        byte ch = 0x00;
        int i = 0;
       if (in == null || in.length <= 0)
            return null;
       String pseudo[] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" };
       StringBuffer out = new StringBuffer(in.length * 2);
       while (i < in.length) {
            ch = (byte) (in[i] & 0xF0);
            ch = (byte) (ch >>> 4);
            ch = (byte) (ch & 0x0F);
            out.append(pseudo[(int) ch]);
            ch = (byte) (in[i] & 0x0F);
            out.append(pseudo[(int) ch]);
            i++;
        }
       String rslt = new String(out);
        return rslt;
   }
   public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }
   public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }
    public static String getString(Object obj){
    	if(obj!=null){
    		return obj.toString();
    	}else{
    		return "";
    	}
    }
   /**
      * checkMaxLength(��󳤶ȼ��)
     */
    public static boolean checkMaxLength(Object str,int length){
    	String info = getString(str);
    	return !(info.length()>length);
    }
   /*
      * compareValues(�Ƚ�����ֵ)
    */
    public static boolean compareValues(String value1,String value2,String type){
    	boolean result = true;
    	String str1 = StringUtil.getString(value1);
    	String str2 = StringUtil.getString(value2);
    	if(isNotEmpty(str1) && isNotEmpty(str2)){
	    	if("number".equals(type)){
	    		float n1 = NumberUtil.convertToFloat(str1);
	    		float n2 = NumberUtil.convertToFloat(str2);
	    		if(n1>n2){
	    			result = false;
	    		}
	    	}else{
	    		if(str1.compareTo(str2)>0){
	    			result = false;
	    		}
	    	}
    	}
    	return result;
    }
   public static int getInt(Object obj){
    	if(obj!=null){
    		return Integer.parseInt(obj.toString());
    	}else{
    		return 0;
    	}
    }
   public static boolean isNumeric(String str){
    	if(isEmpty(str)){
    		return false;
    	}
	    for (int i = str.length();--i>=0;){  
	        if (!Character.isDigit(str.charAt(i))){
	            return false;
	        }
	    }
	    return true;
	}
}