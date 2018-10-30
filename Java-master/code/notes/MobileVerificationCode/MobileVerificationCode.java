package src;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

import src.SMSException;




public class MobileVerificationCode {
	public boolean sendCode(String phone) throws Exception {
		

		CheckSumBuilder cb=new  CheckSumBuilder();
		DefaultHttpClient httpClient = new DefaultHttpClient();
		String url = "https://api.netease.im/sms/sendcode.action";
		HttpPost httpPost = new HttpPost(url);

		//短信模板参数

		String appKey = "92fec95a2e444599c12f7c7a7d667d98";
		String appSecret = "8490b729c658";
		String nonce =  "12345";
		String curTime = String.valueOf((new Date()).getTime() / 1000L);
		String checkSum = cb.getCheckSum(appSecret, nonce ,curTime);//参考 计算CheckSum的java代码
		//String phone = "15988117297";
		//String msg = "领导批阅";
		String CODELEN="6";
		// 设置请求的header
		httpPost.addHeader("AppKey", appKey);
		httpPost.addHeader("Nonce", nonce);
		httpPost.addHeader("CurTime", curTime);
		httpPost.addHeader("CheckSum", checkSum);
		httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("mobile", phone));
		nvps.add(new BasicNameValuePair("deviceId", ""));//是否需要支持短信上行
		nvps.add(new BasicNameValuePair("templateid", "3144256"));//模板编号

		nvps.add(new BasicNameValuePair("codeLen", CODELEN));//是否需要支持短信上行

		nvps.add(new BasicNameValuePair("needUp", "false"));//是否需要支持短信上行


		httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

		// 执行请求
		HttpResponse response = httpClient.execute(httpPost);
		String codenum = EntityUtils.toString(response.getEntity(), "utf-8");
			
        JSONObject json =  new JSONObject(codenum);
        String num=json.optString("code");
        if(num.equals("200")){
        	return true;
        }else if(num.equals("416")){
        	SMSException se=new SMSException("您的手机号接收验证码次数超过今日最大值。");
        	se.setErrorCode("416");
        	throw se;
        }else{
        	return false;
        }
	}
	
	public boolean checkCode(String phone,String code) throws Exception {
			boolean issuc=false;
		    CheckSumBuilder cb=new  CheckSumBuilder();
		    DefaultHttpClient httpClient = new DefaultHttpClient();
	        String url = "https://api.netease.im/sms/verifycode.action";
	        HttpPost httpPost = new HttpPost(url);
	        
	        //短信模板参数

	        String appKey = "92fec95a2e444599c12f7c7a7d667d98";
	        String appSecret = "8490b729c658";
	        String nonce =  "12345";
	        String curTime = String.valueOf((new Date()).getTime() / 1000L);
	        String checkSum = cb.getCheckSum(appSecret, nonce ,curTime);//参考 计算CheckSum的java代码
	        //String phone = "15988117297";
	        //String msg = "领导批阅";
	        // 设置请求的header
	        httpPost.addHeader("AppKey", appKey);
	        httpPost.addHeader("Nonce", nonce);
	        httpPost.addHeader("CurTime", curTime);
	        httpPost.addHeader("CheckSum", checkSum);
	        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

	        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
	        nvps.add(new BasicNameValuePair("mobile", phone));
	        nvps.add(new BasicNameValuePair("code", code));
	        
	        
	        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

	        // 执行请求
	        HttpResponse response = httpClient.execute(httpPost);
	        
	        String codenum = EntityUtils.toString(response.getEntity(), "utf-8");
			try {
		        JSONObject json =  new JSONObject(codenum);
		        String num=json.optString("code");
		        if(num.equals("200")){
		        	issuc=true;
		        }else{
		        	issuc=false;
		        }
			} catch (JSONException e) {
				
				e.printStackTrace();
			}
	        // 打印执行结果
//	        dataView.putReturnData("data", codenum);        
			return issuc;
	}
	static class CheckSumBuilder  {

  	    //计算并获取checkSum
  	    public  String getCheckSum(String appSecret,String nonce,String curTime){
  	        return encode("SHA",appSecret+nonce+curTime);
  	    }

  	    private  String encode(String algorithm,String value){
  	        if(value==null){
  	            return null;
  	        }

  	        try {
  	            MessageDigest messageDigest=MessageDigest.getInstance(algorithm);
  	            messageDigest.update(value.getBytes());
  	            return getFormattedText(messageDigest.digest());
  	        } catch (Exception e) {
  	            throw new RuntimeException(e);
  	        }
  	    }

  	    private  String getFormattedText(byte[] bytes){
  	        int len=bytes.length;
  	        StringBuilder sb=new StringBuilder(len*2);
  	        for(int $i=0;$i<len;$i++){
  	            sb.append(HEX_DIGITS[(bytes[$i]>>4)&0x0f]);
  	            sb.append(HEX_DIGITS[bytes[$i]&0x0f]);
  	        }
  	        return sb.toString();
  	    }

  	    private  final char[] HEX_DIGITS={'0','1','2','3','4','5','6',
  	            '7','8','9','a','b','c','d','e','f'};

  	}

}
