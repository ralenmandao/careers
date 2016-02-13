package com.boot.controller;

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

import com.boot.data.entity.User
import com.boot.data.entity.UserLoginFailure
import com.boot.data.repository.UserLoginFailureRepo

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	UserLoginFailureRepo failRepo
	
	private static final Logger logger = LoggerFactory
			.getLogger(LoginController.class);

	@RequestMapping(method = RequestMethod.GET)
	public String login(Model model, HttpSession session,
		 HttpServletRequest request) {
		if (!model.containsAttribute("user")) {
			model.addAttribute("user", new User());
		}
		
		String ip = request.getRemoteAddr();
		UserLoginFailure failure = failRepo.findByIp(ip)
		if(failure != null){
			def mydate = new Date()
			def faildate = failure.date
//			long hours = (60 * 60 * 60) * 3
			long hours = 1000 * 60
			long diff = (mydate.time - faildate.time)
			if(diff >= hours){
				failRepo.delete(failure)
				return "login";
			}else{
				model.addAttribute("attemp",3 - failure.attempt);
				return "login";
			}
		}
		
		def principal = session.getAttribute("principal")
		
		if(principal != null){
			if(principal.user.role == 'ROLE_CANDIDATE'){
				return "redirect:/candidate";
			}else if(principal.user.role == 'ROLE_EMPLOYER'){
				return "redirect:/employer"
			}else{
				return "redirect:/admin"
			}
		}
		
		return "login";
	}
}
