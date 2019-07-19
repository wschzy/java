//package com.sweet.controller.code;
//
//import java.util.HashMap;
//
//import com.cloopen.rest.sdk.CCPRestSmsSDK;
//
//public class SDKTestSendTemplateSMS {
//	/**
//	 *
//	 * @param phone 要发送的手机号码
//	 * @param body 发送的短信的数组
//	 */
//	public static void sendSMS(String phone,String body[]) {
//		HashMap<String, Object> result = null;
//		//初始化SDK
//		CCPRestSmsSDK restAPI = new CCPRestSmsSDK();
//		restAPI.init("app.cloopen.com", "8883");
//		restAPI.setAccount("8aaf07086b6526f8016b691a9d770224", "7014e85a2f3e4c4a9ed38508d1992f93");
//		restAPI.setAppId("8aaf07086b6526f8016b691a9dca022a");
//		result = restAPI.sendTemplateSMS(phone,"441604" ,body);
//		System.out.println("SDKTestGetSubAccounts result=" + result);
//		/*if("000000".equals(result.get("statusCode"))){
//			//正常返回输出data包体信息（map）
//			HashMap<String,Object> data = (HashMap<String, Object>) result.get("data");
//			Set<String> keySet = data.keySet();
//			for(String key:keySet){
//				Object object = data.get(key);
//				System.out.println(key +" = "+object);
//			}
//		}else{
//			//异常返回输出错误码和错误信息
//			System.out.println("错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg"));
//		}*/
//	}
//
//	public static void main(String[] args) {
//		sendSMS("",new String[]{"大宝贝","18852969161","xxoo","哈哈哈哈"});
//	}
//}
