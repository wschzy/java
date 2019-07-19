//package test;
//
//import java.io.File;
//import java.io.FileNotFoundException;
//import java.util.concurrent.CountDownLatch;
//
//import javax.annotation.Resource;
//
//import com.sweet.hzy.service.imp.Test;
//import org.junit.Before;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.setup.MockMvcBuilders;
//import org.springframework.util.ResourceUtils;
//import org.springframework.web.client.RestTemplate;
//import org.springframework.web.context.WebApplicationContext;
//import com.sweet.Action;
//import com.sweet.hzy.mapper.UserDictionaryMapper;
//import com.sweet.hzy.mapper.UserPayMapper;
//
///*@RunWith(SpringRunner.class)
//@SpringBootTest(classes = Action.class)*/
//public class TestUnit {
//
//    private static  final  int c = 5;
//    public static class ThreadTest implements Runnable{
//        RestTemplate restTemplate;
//        ThreadTest(RestTemplate restTemplate){
//            this.restTemplate = restTemplate;
//        }
//        public void run() {
//            try {
//                count.await();//阻塞
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//            String dl = "http://localhost:8088/SysUserInfo/findUser?loginid=wsc&password=123456";
//            String all = "http://localhost:8088/SysUserInfo/allUser";
//            Object obj = restTemplate.getForObject(all,Object.class);
//            System.out.println(obj);
//        }
//    }
//    public static CountDownLatch count = new CountDownLatch(c);
//
//    public static void main(String[] args) {
//        RestTemplate restTemplate = new RestTemplate();
//        System.out.println("**********开始*****");
//        for (int i = 0; i < c; i++) {
//            new Thread(new ThreadTest(restTemplate)).start();
//            count.countDown();
//        }
//        System.out.println("************结束*****");
//
//    }
//
//}
