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
import com.boot.data.repository.CandidateRepo
import com.boot.data.repository.CountryRepo
import com.boot.data.repository.FieldRepo
import com.boot.data.repository.JobRepo
import com.boot.data.repository.QualificationRepo
import com.boot.data.repository.SkillRepo
import com.boot.data.repository.SpecializationRepo
import com.boot.data.repository.StateRepo;
import com.boot.data.repository.UserRepo
import com.boot.exception.NoPrincipalUserFound
import com.boot.helper.AuthenticationUtil

@Controller
@RequestMapping("/candidate")
public class CandidateController {

	private static final Logger logger = LoggerFactory.getLogger(CandidateController.class);

	@Autowired UserRepo userRepo
	@Autowired CandidateRepo candidateRepo
	@Autowired QualificationRepo qualificationRepo
	@Autowired FieldRepo fieldRepo
	@Autowired SpecializationRepo specializationRepo
	@Autowired SkillRepo skillRepo
	@Autowired CountryRepo countryRepo
	@Autowired StateRepo stateRepo
	@Autowired JobRepo jobRepo

	@RequestMapping(method=RequestMethod.GET)
	public String candidate(Model model, HttpSession session) throws NoPrincipalUserFound{
		Candidate candidate = getPrincipalCandidate();
		def jobs
		logger.info(candidate.toString())
		if(candidate.specialization?.id && candidate.field?.id){
			logger.info 'DOUBLEEEEEEEEEEEEEEEEEEEEE'
			jobs = jobRepo.findBySpecializationIdAndFieldIdOrderByPostedDesc(candidate.specialization.id, candidate.field.id)
		}else if(candidate.specialization != null){
			logger.info 'SPECCCCCCCCCCCCCCCCCCCCCCCCC'
			jobs = jobRepo.findBySpecialization(candidate.specialization.id)
			println jobs
		}else if(candidate.field?.id){
			logger.info 'CANDIDATEEEEEEEEEEEEEEEEEEE'
			jobs = jobRepo.findByFieldIdOrderByPostedDesc(candidate.field.id)
		}else{
			logger.info 'ALLLLLLLLLLLLLLLLLLLLL'
			jobs = jobRepo.findAll()
		}
		session.setAttribute("principal", candidate);
		model.addAttribute('jobs', jobs)
		return "candidate";
	}

	@RequestMapping(params='search')
	public String candidateSearch(Model model,
		@RequestParam('search') String search,
		HttpSession session){
		Candidate candidate = getPrincipalCandidate();
		session.setAttribute("principal", candidate);
		def jobs = jobRepo.findByNameLikeIgnoreCaseOrDescriptionLikeIgnoreCase(search,search)
		println search
		model.addAttribute('jobs', jobs)
		model.addAttribute('search', search)
		return "candidate";
	}

	@RequestMapping(value="edit", method=RequestMethod.GET)
	public String editCandidate(Model model, HttpSession session) throws NoPrincipalUserFound{
		model.addAttribute("qualifications", qualificationRepo.findAll())
		model.addAttribute("fieldOfStudies", fieldRepo.findAll())
		model.addAttribute("specializations", specializationRepo.findAll())
		model.addAttribute("skills", skillRepo.findAll())
		model.addAttribute("countries", countryRepo.findAll())
		session.setAttribute("principal", getPrincipalCandidate());
		return "candidate/edit-candidate";
	}

	// TODO add validation
	@RequestMapping(value="savePersonalInformation", method=RequestMethod.POST)
	public String savePersonalInformation(Model model,
			@RequestParam(name="firstName", required=false) String firstName,
			@RequestParam(name="lastName", required=false) String lastName,
			@RequestParam(name="birthdate", required=false) String birthdate,
			@RequestParam(name="state", required=false) String state,
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
			if(!candidate.location)
				candidate.location = new Location()
			println state
			def dstate = stateRepo.findOne(state)
			def dcountry = countryRepo.findOne(dstate.id)
			candidate.location.state = dstate
			candidate.location.country = dcountry
		}
		logger.info "Updating candidate ${candidate}"
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
			@RequestParam(name="skills", required=false) String skills,
			HttpSession session){
		Candidate candidate = getPrincipalCandidate();

		if(skills){
			candidate.skills = []
			skills.split(',').each{
				candidate.skills.add(skillRepo.findOne(it))
			}
		}

		if(specialization){
			def sp = specializationRepo.findOne(specialization)
			candidate.specialization = sp
		}
		if(fieldOfStudy){
			def fd = fieldRepo.findOne(fieldOfStudy)
			candidate.field = fd
		}
		if(qualification){
			def ql = qualificationRepo.findOne(qualification)
			candidate.qualification = ql
		}
		if(salary){
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
		Candidate candidate = getPrincipalCandidate()
		if(candidate.resumeName){
			return "redirect:/candidate/resume"	
		}
		return "resume/registration"
	}

	@RequestMapping(value="addResume", method=RequestMethod.POST)
	public String addResumePost(){
		Candidate candidate = getPrincipalCandidate()
		candidate.resumeName = "resume1"
		candidateRepo.save(candidate)
		return "redirect:/candidate/resume"
	}
	
	@RequestMapping(value="resume", method=RequestMethod.GET)
	public String resume(Model model){
		Candidate candidate = getPrincipalCandidate()
		model.addAttribute("params", candidate.resumeParams)
		return "resume/resume1"
	}

	@RequestMapping(value="editResune", method=RequestMethod.GET)
	public String editResume(Model model){
		Candidate candidate = getPrincipalCandidate()

		return "resume/resume1-output"
	}

	private Candidate getPrincipalCandidate(){
		String principalUser = AuthenticationUtil.getPrincipal();
		def user = userRepo.findByUsername(principalUser)
		def candidate = candidateRepo.findByUserId(user.id)
		return candidate
	}
}
