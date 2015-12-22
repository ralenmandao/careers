package com.boot.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/")
public class HomeController {
	@RequestMapping(method = RequestMethod.GET)
	public String home(Locale locale ,Model model){
		return "home";
	}
	
	@RequestMapping(value ="/404", method = RequestMethod.GET)
	public String my404(Locale locale ,Model model){
		return "404";
	}
	
	@RequestMapping(value="second-resume")
	public String firstResume(){
		return "resume/second-resume/main";
	}
}
