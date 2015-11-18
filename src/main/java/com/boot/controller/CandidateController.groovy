package com.boot.controller;

import java.sql.Date

import javax.servlet.http.HttpSession

import org.junit.After;
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

import com.boot.data.entity.Candidate
import com.boot.data.entity.FieldOfStudy
import com.boot.data.entity.Location
import com.boot.data.entity.Qualification
import com.boot.data.entity.Specialization
import com.boot.data.repository.GCandidateRepository
import com.boot.data.repository.GFieldOfStudyRepository;
import com.boot.data.repository.GQualificationRepository
import com.boot.data.repository.GSpecializationRepository
import com.boot.exception.NoPrincipalUserFound
import com.boot.helper.AuthenticationUtil

import scala.annotation.meta.field;

@Controller
@RequestMapping("/candidate")
public class CandidateController {
	
	private static final Logger logger = LoggerFactory.getLogger(CandidateController.class);
	
	@Autowired
	GCandidateRepository candidateRepo
	@Autowired
	GCountryRepository countryRepo
	@Autowired
	GStateRepository stateRepo
	@Autowired
	GQualificationRepository qualificationRepo
	@Autowired
	GFieldOfStudyRepository fdRepo
	@Autowired
	GSpecializationRepository specializationRepo
	
	@RequestMapping(method=RequestMethod.GET)
	public String candidate(Model model, HttpSession session) throws NoPrincipalUserFound{
        Candidate candidate = getPrincipalCandidate();
        // TODO get the candidate by email
        //session.setAttribute("candidate", candidateService.getByUsername(principalUser));
		// Add the principal to the session to retrieve data from db
        logger.info("Principal : " + candidate);
        session.setAttribute("principal", candidate);
        logger.info("Going to candidate.jsp");
		return "candidate";
	}
	
	@RequestMapping(value="edit", method=RequestMethod.GET)
	public String editCandidate(Model model, HttpSession session) throws NoPrincipalUserFound{
		logger.info(countryRepo.findAll().toString())
		model.addAttribute("qualifications", qualificationRepo.findAll())
		model.addAttribute("fieldOfStudies", fdRepo.findAll())
		model.addAttribute("specializations", specializationRepo.findAll())
		session.setAttribute("principal", getPrincipalCandidate());
		return "candidate/edit-candidate";
	}
		
	// TODO add validation
	@RequestMapping(value="savePersonalInformation", method=RequestMethod.POST)
	public String savePersonalInformation(Model model,
			@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName,
			@RequestParam("birthdate") String birthdate,
			@RequestParam("country") String country,
			@RequestParam("state") String state,
			@RequestParam("contact") String contact) throws NoPrincipalUserFound{
		
		logger.info(contact + "");
		// TODO What happen here ?
		// Site appends , at the end
		contact = contact.replace(",", "");
		
		Candidate candidate = getPrincipalCandidate();
		logger.info(candidate.toString())
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
		return "redirect:/candidate/edit";
	}
			
	@RequestMapping(value="saveProfessionalInformation", method=RequestMethod.POST)
	public String saveProfessionalInformation(Model model,
		@RequestParam("qualification") String qualification,
		@RequestParam("fieldOfStudy") String fieldOfStudy,
		@RequestParam("specialization") String specialization,
		@RequestParam("salary") String salary,
		HttpSession session){
		Candidate candidate = getPrincipalCandidate();
		logger.info(candidate.toString())
		def sp = specializationRepo.findOne(specialization)
		logger.info(sp.toString())
		def fd = fdRepo.findOne(fieldOfStudy)
		logger.info(fd.toString())
		def ql = qualificationRepo.findOne(qualification)
		logger.info(ql.toString())
		candidate.qualification = ql
		candidate.specialization = sp
		candidate.fieldOfStudy = fd
		candidate.expectedSalary = Integer.parseInt(salary)
		candidateRepo.save(candidate)
		return "redirect:/candidate/edit";
	}
		
	private Candidate getPrincipalCandidate(){
		String principalUser = AuthenticationUtil.getPrincipal();
		Candidate candidate = candidateRepo.findByUserUsername(principalUser);
		return candidate
	}
}
