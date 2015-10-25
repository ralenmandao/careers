package com.boot.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boot.data.service.CandidateService;
import com.boot.data.service.CountryService;
import com.boot.exception.NoPrincipalUserFound;
import com.boot.helper.AuthenticationUtil;

@Controller
@RequestMapping("/candidate")
public class CandidateController {
	
	private static final Logger logger = LoggerFactory.getLogger(CandidateController.class);
	
	@Autowired
	private CandidateService candidateService;
	@Autowired
	private CountryService countryService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String candidate(Model model, HttpSession session) throws NoPrincipalUserFound{
        String principalUser = AuthenticationUtil.getPrincipal();
        session.setAttribute("candidate", candidateService.findByEmail(principalUser));
		logger.info("Going to candidate.jsp");
		return "candidate";
	}
	
	@RequestMapping(value="edit", method=RequestMethod.GET)
	public String editCandidate(Model model){
		model.addAttribute("countries", countryService.findAll());
		return "candidate/edit-profile";
	}
}
