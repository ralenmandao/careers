package com.boot.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boot.data.entity.User;
import com.boot.data.service.CandidateService;
import com.boot.data.service.UserService;
import com.boot.data.validation.UserLoginValidator;

@Controller
@RequestMapping("/login")
public class LoginController {

	private static final Logger logger = LoggerFactory
			.getLogger(LoginController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private CandidateService candidateService;

	@RequestMapping(method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		// if(session.getAttribute("candidate") != null){
		// return "redirect:/candidate";
		// }

		if (!model.containsAttribute("user")) {
			model.addAttribute("user", new User());
		}
		return "login";
	}

	// @RequestMapping(method = RequestMethod.POST)
	// public String loginUser(Model model,
	// Errors errors, HttpSession session){

	// User myuser = null;
	// if(!errors.hasErrors()){
	// myuser = userService.findByEmailAndPassword(user.getEmail(),
	// user.getPassword());
	// if(myuser == null){
	// errors.rejectValue("email", "", "Email and password does not match");
	// }
	// }
	//
	// if(errors.hasErrors()){
	// model.addAttribute("errors", errors.getAllErrors());
	// return "login";
	// }
	// if(myuser.getType().toLowerCase().equals("candidate")) {
	// session.setAttribute("candidate",
	// candidateService.findByUserId(myuser.getUserId()));
	// return "redirect:/candidate";
	// }
	// else if(myuser.getType().equals("EMPLOYER")) return "redirect:/employer";
	// else if(myuser.getType().equals("ADMIN")) return "redirect:/admin";
	// else return "404";
	// return "home";
	// }

	// @InitBinder
	// public void initBinder(WebDataBinder binder){
	// binder.addValidators(new UserLoginValidator());
	// }
}
