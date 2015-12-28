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
import com.boot.helper.MailMail

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired UserRepo userRepo
	@Autowired CandidateRepo candidateRepo
	@Autowired MailMail mail
	
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
		

		if(userRepo.findByEmail(candidateRegistration.getUser().getEmail())){
			errors.rejectValue("user.email", "", "Email already exist");
		}
			
		if(errors.hasErrors()){
			model.addAttribute("errors", errors.getFieldErrors());
			return "register";
		}
		
		// Setup the candidate
		candidateRegistration.user.username = candidateRegistration.user.email
		candidateRegistration.user.role = "ROLE_CANDIDATE"
		candidateRegistration.user.enabled = false
		userRepo.save(candidateRegistration.user)
		candidateRepo.save(candidateRegistration)
		
		
		mail.sendMail("DHVTSU-CAREERS", candidateRegistration.user.email,"Account Activation",
			"To activate your account please click the activation link http://localhost:8080/candidate/activate/${candidateRegistration.id}");
		return "redirect:/login/?success";
	}
}
