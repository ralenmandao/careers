package com.boot.controller;

import java.text.SimpleDateFormat

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
import com.boot.data.service.CandidateService
import com.boot.data.service.CountryService
import com.boot.data.service.FieldService
import com.boot.data.service.LocationService
import com.boot.data.service.QualificationService
import com.boot.data.service.SkillService
import com.boot.data.service.SpecializationService
import com.boot.data.service.StateService
import com.boot.exception.NoPrincipalUserFound
import com.boot.helper.AuthenticationUtil

@Controller
@RequestMapping("/candidate")
public class CandidateController {
	
	private static final Logger logger = LoggerFactory.getLogger(CandidateController.class);
	
	@Autowired QualificationService qualificationService
	@Autowired FieldService fieldService
	@Autowired SpecializationService SpecializationService
	@Autowired SkillService skillService
	@Autowired CandidateService candidateService
	@Autowired CountryService countryService
	@Autowired StateService stateService
	@Autowired LocationService locationService
	
	@RequestMapping(method=RequestMethod.GET)
	public String candidate(Model model, HttpSession session) throws NoPrincipalUserFound{
        Candidate candidate = getPrincipalCandidate();
        session.setAttribute("principal", candidate);
		return "candidate";
	}
	
	@RequestMapping(value="edit", method=RequestMethod.GET)
	public String editCandidate(Model model, HttpSession session) throws NoPrincipalUserFound{
		model.addAttribute("qualifications", qualificationService.getAll())
		model.addAttribute("fieldOfStudies", fieldService.getAll())
		model.addAttribute("specializations", SpecializationService.getAll())
		model.addAttribute("skills", skillService.getAll())
		model.addAttribute("countries", countryService.getAll())
		session.setAttribute("principal", getPrincipalCandidate());
		return "candidate/edit-candidate";
	}
		
	// TODO add validation
	@RequestMapping(value="savePersonalInformation", method=RequestMethod.POST)
	public String savePersonalInformation(Model model,
			@RequestParam(name="firstName", required=false) String firstName,
			@RequestParam(name="lastName", required=false) String lastName,
			@RequestParam(name="birthdate", required=false) String birthdate,
			@RequestParam(name="state", required=false) Long state,
			@RequestParam(name="contact", required=false) String contact) throws NoPrincipalUserFound{
		
//		// TODO BUG
//		// Website adds a comma(,)
		contact = contact.replace(",", "");
		
		Candidate candidate = getPrincipalCandidate();
		if(birthdate) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			candidate.setBirthdate(sdf.parse(birthdate))
		}
		candidate.setContactNo(contact);
		candidate.setFirstName(firstName);
		candidate.setLastName(lastName);
		if(state){
			def dstate = stateService.get(state)
			def dcountry = countryService.get(dstate.countryId)
			logger.info "Adding or Updateing state ${dstate}"
			logger.info  "Adding or Updating country ${dcountry}"
			logger.info "Current candidate.location is ${candidate.location == null}"
			if(candidate.location.locationId){
				logger.info "Updating location ${candidate.location}"
				candidate.location.state = dstate
				candidate.location.country = dcountry
				locationService.update(candidate.location)
			}else{
				Location location = new Location()
				location.state = dstate
				location.country = dcountry
				locationService.add(location)
				candidate.location = location
				logger.info "Location added ${location}"
			}
		}
		logger.info "Updating candidate ${candidate}"
		candidateService.update(candidate);
		return "redirect:/candidate/edit";
	}
//			
//	@RequestMapping(value="saveProfessionalInformation", method=RequestMethod.POST)
//	public String saveProfessionalInformation(Model model,
//		@RequestParam(name="qualification", required=false) String qualification,
//		@RequestParam(name="fieldOfStudy", required=false) String fieldOfStudy,
//		@RequestParam(name="specialization", required=false) String specialization,
//		@RequestParam(name="salary", required=false) String salary,
//		@RequestParam(name="title", required=false) String title,
//		@RequestParam(name="skills", required=false) String skills,
//		HttpSession session){
//		Candidate candidate = getPrincipalCandidate();
//		
//		if(skills != null){
//			candidate.skills = []
//			skills.split(',').each{
//				candidate.skills.add(skillRepo.findOne(it))
//			}
//		}
//		
//		if(specialization != null){
//			def sp = specializationRepo.findOne(specialization)
//			candidate.specialization = sp
//		}
//		if(fieldOfStudy != null){
//			def fd = fdRepo.findOne(fieldOfStudy)
//			candidate.fieldOfStudy = fd
//		}
//		if(qualification != null){
//			def ql = qualificationRepo.findOne(qualification)
//			candidate.qualification = ql
//		}
//		if(salary != null){
//			if(salary.isNumber()){
//				candidate.expectedSalary = Integer.parseInt(salary)
//			}
//		}
//		candidate.title = title
//		candidateRepo.save(candidate)
//		return "redirect:/candidate/edit";
//	}
//		
//	@RequestMapping(value="addResume", method=RequestMethod.GET)
//	public String addResume(){
//		return "resume/resume1-output"
//	}	
//	
//	@RequestMapping(value="resume", method=RequestMethod.GET)
//	public String resume(Model model){
//		Candidate candidate = getPrincipalCandidate()
//		model.addAttribute("params", candidate.resumeParams)
//		return "resume/resume1-output"
//	}
//	
//	@RequestMapping(value="editResune", method=RequestMethod.GET)
//	public String editResume(Model model){
//		Candidate candidate = getPrincipalCandidate()
//		
//		return "resume/resume1-output"
//	}
//	
	private Candidate getPrincipalCandidate(){
		String principalUser = AuthenticationUtil.getPrincipal();
		Candidate candidate = candidateService.findByUserUsername(principalUser);
		return candidate
	}
}
