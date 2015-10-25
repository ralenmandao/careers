package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.data.jdbc.JdbcOperations;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	private JdbcOperations operations;
	
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String test(){
		
		return Long.toString((long) operations.queryForObject("SELECT COUNT(*) FROM user", Long.class));
	}
}
