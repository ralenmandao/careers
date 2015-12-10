package com.boot.controller;

import javax.servlet.http.HttpSession

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.validation.Errors
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

import com.boot.data.entity.Candidate
import com.boot.data.repository.CandidateRepo
import com.boot.data.repository.UserRepo

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired UserRepo userRepo
	@Autowired CandidateRepo candidateRepo
	
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
			if(userRepo.findByEmail(candidateRegistration.getUser().getEmail())){
				errors.rejectValue("user.username", "", "Email already exist");
			}
		}
		
		if(errors.hasErrors()){
			model.addAttribute("errors", errors.getFieldErrors());
			return "register";
		}
		
		// Setup the candidate
		candidateRegistration.user.username = candidateRegistration.user.email
		candidateRegistration.user.role = "ROLE_CANDIDATE"
		candidateRegistration.user.enabled = true
		userRepo.save(candidateRegistration.user)
		candidateRepo.save(candidateRegistration)
		return "redirect:/login/?success";
	}
}
