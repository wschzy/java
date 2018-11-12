package com.sweet.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VipController {

	@RequestMapping("/index.do")
	public String name(Map<String,String> map) {
		map.put("name","java");
		return "a";
	}
	
}
