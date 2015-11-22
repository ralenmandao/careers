package com.boot.controller;

import java.sql.Date

import javax.servlet.http.HttpSession

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

import com.boot.data.entity.Candidate
import com.boot.data.entity.Location
import com.boot.data.repository.GCandidateRepository
import com.boot.data.repository.GFieldOfStudyRepository
import com.boot.data.repository.GQualificationRepository
import com.boot.data.repository.GSpecializationRepository
import com.boot.data.repository.SkillRepository
import com.boot.exception.NoPrincipalUserFound
import com.boot.helper.AuthenticationUtil

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
	@Autowired
	SkillRepository skillRepo
	
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
		model.addAttribute("skills", skillRepo.findAll())
		// Default reload the principal and attach it to session
		session.setAttribute("principal", getPrincipalCandidate());
		return "candidate/edit-candidate";
	}
		
	// TODO add validation
	@RequestMapping(value="savePersonalInformation", method=RequestMethod.POST)
	public String savePersonalInformation(Model model,
			@RequestParam(name="firstName", required=false) String firstName,
			@RequestParam(name="lastName", required=false) String lastName,
			@RequestParam(name="birthdate", required=false) String birthdate,
			@RequestParam(name="country", required=false) String country,
			@RequestParam(name="state", required=false) String state,
			@RequestParam(name="contact", required=false) String contact) throws NoPrincipalUserFound{
		
		// TODO BUG
		// Website adds a comma(,)
		contact = contact.replace(",", "");
		
		Candidate candidate = getPrincipalCandidate();
		if(birthdate != null) candidate.setBirthdate(Date.valueOf(birthdate))
		candidate.setContactNo(contact);
		candidate.setFirstName(firstName);
		candidate.setLastName(lastName);
		Location loc = new Location();
		if(country != null) loc.country = countryRepo.findOne(country)
		if(state != null) loc.state = stateRepo.findOne(state)
		candidate.setLocation(loc);
		candidateRepo.save(candidate);
		return "redirect:/candidate/edit";
	}
			
	@RequestMapping(value="saveProfessionalInformation", method=RequestMethod.POST)
	public String saveProfessionalInformation(Model model,
		@RequestParam(name="qualification", required=false) String qualification,
		@RequestParam(name="fieldOfStudy", required=false) String fieldOfStudy,
		@RequestParam(name="specialization", required=false) String specialization,
		@RequestParam(name="salary", required=false) String salary,
		@RequestParam(name="title", required=false) String title,
		HttpSession session){
		Candidate candidate = getPrincipalCandidate();
		if(specialization != null){
			def sp = specializationRepo.findOne(specialization)
			candidate.specialization = sp
		}
		if(fieldOfStudy != null){
			def fd = fdRepo.findOne(fieldOfStudy)
			candidate.fieldOfStudy = fd
		}
		if(qualification != null){
			def ql = qualificationRepo.findOne(qualification)
			candidate.qualification = ql
		}
		if(salary != null){
			if(salary.isNumber()){
				candidate.expectedSalary = Integer.parseInt(salary)
			}
		}
		candidate.title = title
		candidateRepo.save(candidate)
		return "redirect:/candidate/edit";
	}
		
	@RequestMapping(value="addResume", method=RequestMethod.GET)
	public String addResume(){
		return "resume/resume1-registration"
	}	
	
	private Candidate getPrincipalCandidate(){
		String principalUser = AuthenticationUtil.getPrincipal();
		Candidate candidate = candidateRepo.findByUserUsername(principalUser);
		return candidate
	}
}
