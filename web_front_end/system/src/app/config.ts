
function getAppConfig() {

    const AppConfig = {
      // http请求地址
       requestUrl: "http://www.hbwb.xyz:8081/",
       cityUrl:"http://wthrcdn.etouch.cn/weather_mini?city="
      //requestUrl: "http://192.168.137.162:8088/"
    };
    return AppConfig;
  }
  
  export const APPCONFIG = getAppConfig();
  