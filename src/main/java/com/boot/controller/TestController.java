package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.data.jdbc.JdbcOperations;
import com.boot.data.service.CandidateService;
import com.boot.data.service.UserService;
import com.boot.exception.repository.MultipleRegisteredUserException;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	private JdbcOperations operations;
	@Autowired
	private UserService userService;
	@Autowired
	private CandidateService candidateService;
	
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String test() throws MultipleRegisteredUserException{
		return candidateService.findById(1L).toString();
	}
}