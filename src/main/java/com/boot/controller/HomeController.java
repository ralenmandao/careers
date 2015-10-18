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
	
//	@RequestMapping(value = "/logout", method=RequestMethod.POST)
//	public String logout(HttpSession session, 
//			HttpServletRequest request, 
//			HttpServletResponse response){
////		logger.info("removing candidate to the session");
////		session.removeAttribute("candidate");
////		logger.info("redirecting to /");
////		return "redirect:/";
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        if (auth != null){    
//            new SecurityContextLogoutHandler().logout(request, response, auth);
//        }
//        return "redirect:/login?logout";
//	}
}
