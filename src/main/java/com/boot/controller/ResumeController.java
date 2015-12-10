package com.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	@RequestMapping(method=RequestMethod.GET)
	public String resumeCreator(){
		return "resume/registration";
	}
}
