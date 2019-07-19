package com.sweet.hzy.service.imp;

import org.springframework.web.client.RestTemplate;

import java.util.*;
import java.util.concurrent.CountDownLatch;

public class Test {
    //双端队列
    static void A(){
        Deque<String> deque = new LinkedList<>();
        deque.offer("one");
        deque.offer("two");
        deque.offer("three");
        System.out.println(deque);
        deque.offerFirst("four");
        System.out.println(deque);
        deque.offerLast("five");
        System.out.println(deque);
        String str = deque.poll();
        System.out.println(str);
        System.out.println(deque);
        str = deque.pollFirst();
        System.out.println(str);
        System.out.println(deque);
        str = deque.pollLast();
        System.out.println(str);
        System.out.println(deque);
    }

    //栈
    static void B(){
        Deque<String> stack = new LinkedList<>();
        stack.push("one");
        stack.push("two");
        stack.push("three");
        stack.push("four");
        stack.push("five");
        System.out.println(stack);
        String str = stack.pop();
        System.out.println(str);
        System.out.println(stack);
        //遍历操作
        for(String s : stack) {
            System.out.println(s);
        }
        System.out.println(stack);
        //用pop方法遍历栈
        while(stack.size()>0) {
            String s = stack.pop();
            System.out.println(s);
        }
        System.out.println(stack);
    }

    //队列
    static void C(){
        Queue<String> queue = new LinkedList<>();
        //入队操作，将元素添加到队列末尾
        queue.offer("one");
        queue.offer("two");
        queue.offer("three");
        queue.offer("four");
        System.out.println(queue);
        /*
         * poll 出队操作
         * 获取并删除当前队列的队首元素
         */
        String str = queue.poll();
        System.out.println(str);
        System.out.println(queue);
        /*
         * peek 引用队首元素
         * 获取队首元素，但是不做删除操作
         */
        str = queue.peek();
        System.out.println(str);
        System.out.println(queue);

        /*
         * 遍历队列
         * 使用迭代器遍历后，元素还是在队列当中的。
         */
        for(String s : queue) {
            System.out.println(s);
        }
        System.out.println(queue);
    }
    public static class ThreadTest implements Runnable{
        RestTemplate restTemplate;
        ThreadTest(RestTemplate restTemplate){
            this.restTemplate = restTemplate;
        }

        @Override
        public void run() {
            try {
                count.await();//阻塞
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            Object obj = restTemplate.postForObject("http://localhost:8089/SysUserInfo/findUser?loginid=wsc&password=123456",Object.class,null);
            System.out.println(obj);
        }
    }
    public static CountDownLatch count = new CountDownLatch(200);
    public static void main(String[] args) throws Exception{
        RestTemplate restTemplate = new RestTemplate();

        for (int i=0;i<200;i++){
            new Thread(new ThreadTest(restTemplate)).start();
            count.countDown();
        }


        /*ThreadTest t1 = new ThreadTest("A");
        ThreadTest t2 = new ThreadTest("B");
        t1.start();
        *//**
         * join()方法只会使主线程进入等待池并等待t线程执行完毕后才会被唤醒，并不影响同一时刻处在运行状态的其他线程。
         *//*
        //t1.join();
        t2.start();
        System.out.println("over");*/
    }
       /* String[] atp = {"Rafael Nadal", "Novak Djokovic",
                "Stanislas Wawrinka",
                "David Ferrer","Roger Federer",
                "Andy Murray","Tomas Berdych",
                "Juan Martin Del Potro"};
        List<String> players =  Arrays.asList(atp);

// 以前的循环方式
        for (String player : players) {
            //System.out.print(player + "; ");
        }

// 使用 lambda 表达式以及函数操作(functional operation)
        players.forEach((player) -> System.out.print(player + "; "));

// 在 Java 8 中使用双冒号操作符(double colon operator)
        players.forEach(System.out::print);
    }*/
}
/*
class ThreadTest extends Thread {
    private String name;
    public ThreadTest(String name){
        this.name=name;
    }
    public void run(){
        for(int i=1;i<=500;i++){
            System.out.println(name+"-"+i);
        }
    }
}*/
