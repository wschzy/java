package com.sweet.controller;

import com.sweet.util.FinalString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.JedisCluster;
import redis.clients.jedis.Tuple;

import java.util.Date;
import java.util.Set;

@RestController
@RequestMapping(value="/rank")
public class OperationRecordsCtrl {

    @Autowired
    private JedisCluster jedisCluster;

    @GetMapping(value = "get")
    public Set<Tuple> getOperationRecords(){
        String dateStr = FinalString.getDateStr(new Date(),null);
        String key = FinalString.key+":"+dateStr;
        Long max = jedisCluster.zcard(key);
        Set<Tuple> tup =  jedisCluster.zrangeWithScores(key,max-100,max-1);
        return tup;
    }
}
