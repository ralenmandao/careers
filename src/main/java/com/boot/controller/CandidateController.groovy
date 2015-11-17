package com.boot.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.data.entity.Candidate;
import com.boot.data.entity.GCandidateRepository;
import com.boot.data.entity.Location
import com.boot.data.repository.GQualificationRepository;
import com.boot.exception.NoPrincipalUserFound;
import com.boot.helper.AuthenticationUtil;

@Controller
@RequestMapping("/candidate")
public class CandidateController {
	
	private static final Logger logger = LoggerFactory.getLogger(CandidateController.class);
	
	@Autowired
	private GCandidateRepository candidateRepo;
	@Autowired
	private GCountryRepository countryRepo;
	@Autowired
	private GStateRepository stateRepo;
	@Autowired
	private GQualificationRepository qualificationRepo;
	
	@RequestMapping(method=RequestMethod.GET)
	public String candidate(Model model, HttpSession session) throws NoPrincipalUserFound{
        String principalUser = AuthenticationUtil.getPrincipal();
        // TODO get the candidate by email
        //session.setAttribute("candidate", candidateService.getByUsername(principalUser));
		// Add the principal to the session to retrieve data from db
        logger.info("Principal : " + principalUser);
        session.setAttribute("principal", candidateRepo.findByUserUsername(principalUser));
        logger.info("Going to candidate.jsp");
		return "candidate";
	}
	
	@RequestMapping(value="edit", method=RequestMethod.GET)
	public String editCandidate(Model model) throws NoPrincipalUserFound{
		//model.addAttribute("countries", countryRepo.findAll());
		logger.info(countryRepo.findAll().toString());
		model.addAttribute("qualifications", qualificationRepo.findAll())
		return "candidate/edit-candidate";
	}
	
	@RequestMapping(value="savePersonalInformation", method=RequestMethod.POST)
	public String savePersonalInformation(Model model,
			@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName,
			@RequestParam("birthdate") String birthdate,
			@RequestParam("country") String country,
			@RequestParam("state") String state,
			@RequestParam("contact") String contact,
			HttpSession session) throws NoPrincipalUserFound{
		
		logger.info(contact + "");
		// TODO What happen here ?
		// Site appends , at the end
		contact = contact.replace(",", "");
		
		String principalUser = AuthenticationUtil.getPrincipal();
		Candidate candidate = candidateRepo.findByUserUsername(principalUser);
		
		Date birthDate = Date.valueOf(birthdate);
		candidate.setBirthdate(birthDate);
		candidate.setContactNo(contact);
		candidate.setFirstName(firstName);
		candidate.setLastName(lastName);
		Location loc = new Location();
		loc.country = countryRepo.findOne(country)
		loc.state = stateRepo.findOne(state)
		candidate.setLocation(loc);
		candidateRepo.save(candidate);
		session.setAttribute("principal", candidate);
		return "candidate/edit-candidate";
	}
}
