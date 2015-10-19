package com.boot.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boot.data.service.CandidateService;
import com.boot.data.validation.ImageUploadValidator;

@Controller
@RequestMapping("/candidate")
public class CandidateController {
	
	private static final Logger logger = LoggerFactory.getLogger(CandidateController.class);
	
	@Autowired
	private CandidateService candidateService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String candidate(Model model, HttpSession session){
		// Check if there is a candidate in the session
//		logger.info("Checking if there is candidate in the session");
//		if(session.getAttribute("candidate") == null){
//			logger.info("no candidate found in the session, redirecting to /login");
//			return "redirect:/login";
//		}
        String principalUser = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
        	principalUser = ((UserDetails)principal).getUsername();
        } else {
        	principalUser = principal.toString();
        }
        //model.addAttribute("candidate", candidateService.findByEmail(principalUser));
        session.setAttribute("candidate", candidateService.findByEmail(principalUser));
		logger.info("Going to candidate.jsp");
		return "candidate";
	}
	
	@RequestMapping(value="edit", method=RequestMethod.GET)
	public String editCandidate(){
		return "candidate/edit-profile";
	}
}
