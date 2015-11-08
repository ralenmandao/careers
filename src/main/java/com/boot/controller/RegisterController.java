package com.boot.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boot.data.entity.Candidate;
import com.boot.data.entity.CandidateRegistrationEntity;
import com.boot.data.service.CandidateService;
import com.boot.data.service.UserService;
import com.boot.data.validation.CandidateRegistrationValidator;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private CandidateService candidateService; 
	
	@RequestMapping(method=RequestMethod.GET)
	public String register(Model model){
		if(!model.containsAttribute("candidateRegistration")){
			model.addAttribute("candidateRegistration", new Candidate());
		}
		return "register";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String registerCandidate(Model model, 
			@ModelAttribute("candidateRegistration") Candidate candidateRegistration,
			Errors errors, HttpSession session) throws Exception{
		
		// check email availability if and only if email field does not have an error
		if(errors.getFieldError("user.username") == null){
			if(userService.emailExist(candidateRegistration.getUser().getUsername())){
				errors.rejectValue("user.username", "", "Email already exist");
			}
		}
		
		if(errors.hasErrors()){
			model.addAttribute("errors", errors.getFieldErrors());
			return "register";
		}
		
		// Add candidate if there is no errors
		candidateService.add(candidateRegistration);
		// Add candidate to the Session
		//session.setAttribute("candidate", candidateRegistration);
		return "redirect:/candidate/";
	}
}
