package com.sweet.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value="/cmd")
public class Cmd {
    @RequestMapping(value="/start")
    public void start(){
        try {
            List<String> paramList = new ArrayList<String>();
            paramList.add("C:\\Users\\Administrator\\Desktop\\mysql.bat");
            /** 创建ProcessBuilder对象，设置指令列表*/
            ProcessBuilder processBuilder = new ProcessBuilder(paramList);
            processBuilder.start();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
