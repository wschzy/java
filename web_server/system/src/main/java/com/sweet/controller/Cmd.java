package com.sweet.controller;

import org.springframework.web.bind.annotation.*;

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

    @GetMapping(value = "reset/{id}")
    public String restFulG(@PathVariable Integer id){
        return "查询："+id;
    }

    @GetMapping(value = "reset/{id}/{name}")
    public String restFul(@PathVariable Integer id,@PathVariable String name){
        return "查询："+id+name;
    }

    @PostMapping(value = "reset")
    public String restFulI(){
        return "新增";
    }

    @DeleteMapping(value = "reset/{id}")
    public String restFulD(@PathVariable Integer id){
        return "删除："+id;
    }

    @PutMapping(value = "reset/{id}")
    public String restFulP(@PathVariable Integer id){
        return "修改："+id;
    }
}
