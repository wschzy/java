//package com.sweet.bean;
//
//import com.alibaba.druid.proxy.jdbc.ClobProxyImpl;
//import sun.reflect.annotation.ExceptionProxy;
//
//import javax.servlet.http.HttpServletRequest;
//import java.io.BufferedReader;
//import java.io.Reader;
//import java.io.Serializable;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.Map;
//
//public class SuperEntity  extends HashMap implements Map{
//
//
//    private Map map;
//    private HttpServletRequest request;
//
//    public SuperEntity(HttpServletRequest request){
//
//        this.request = request;
//        Map properties = request.getParameterMap();
//        Map returnMap = new HashMap();
//        Iterator entries = properties.entrySet().iterator();
//
//        Map.Entry entry;
//        String name = "";
//        String value = "";
//
//        while (entries.hasNext()){
//            entry = (Map.Entry)entries.next();
//            name = (String) entry.getKey();
//            Object valueObj = entry.getValue();
//
//            if(null==valueObj){
//                value = "";
//            }else if(valueObj instanceof String[]){
//
//                String[] values = (String[]) valueObj;
//                for(int i=0;i<values.length;i++){
//                    value = values[i]+",";
//                }
//                value = value.substring(0,value.length()-1);
//            }else{
//                value = valueObj.toString();
//            }
//
//            returnMap.put(name,value);
//        }
//        map = returnMap;
//    }
//
//    public SuperEntity(){
//        map = new HashMap();
//    }
//
//    @Override
//    public Object get(Object key) {
//        Object obj = null;
//        if(map.get(key) instanceof Object[]){
//            Object[] arr = (Object[]) map.get(key);
//
//            // 连续的三目运算
//            obj = request == null ? arr : (request.getParameter((String)key) == null ? arr : arr[0]);
//
//        }else{
//            obj = map.get(key);
//        }
//        return obj;
//    }
//
//    public String getString(Object key){
//        // 调用自身上一个方法
//        return (String) get(key);
//    }
//
//
//    @Override
//    public Object put(Object key, Object value) {
//
//        /**
//         * Oarcle 数据库中的 LOB 类型：
//         * 在 Oracle 中，LOB（Large Object，大型对象）类型的字段现在用得越来越多了。因为这种类型的字段，容量大（最多能容纳4GB的数据），
//         * 且一个表中可以有多个这种类型的字段，很灵活，适用于数据量非常大的业务领域（如图象、档案等）。
//         *
//         * LOB 类型分为 BLOB 和 CLOB 两种：
//         * BLOB 即二进制大型对象（Binary Large Object），适用于存贮非文本的字节流数据（如程序、图象、影音等）。
//         * CLOB，即字符型大型对象（Character Large Object），则与字符集相关，适于存贮文本型的数据（如历史档案、大部头著作等）。
//         *
//         * ClobProxyImpl，则是 alibaba 对 oracle clob类型数据操作的方法封装。
//         */
//        if(value instanceof ClobProxyImpl){
//            try{
//                // 读取 oracle Clob 类型数据
//                ClobProxyImpl cpi = (ClobProxyImpl) value;
//
//                // 获取流
//                Reader is = cpi.getCharacterStream();
//                BufferedReader br = new BufferedReader(is);
//                String str = br.readLine();
//
//                StringBuffer sb = new StringBuffer();
//
//                //循环读取数据拼接到字符串
//                while (str!=null){
//                    sb.append(str);
//                    sb.append("\n");
//                    str = br.readLine();
//                }
//                value = sb.toString();
//            }catch (Exception e){
//                e.printStackTrace();
//            }
//        }
//        return map.put(key,value);
//    }
//}
