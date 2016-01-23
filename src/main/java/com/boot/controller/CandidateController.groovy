package com.boot.controller;

import java.text.SimpleDateFormat

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.multipart.MultipartFile

import com.boot.data.entity.Candidate
import com.boot.data.entity.Education
import com.boot.data.entity.Experience;
import com.boot.data.entity.Location
import com.boot.data.entity.Resume1
import com.boot.data.repository.CandidateApplicationRepo
import com.boot.data.repository.CandidateRepo
import com.boot.data.repository.CountryRepo
import com.boot.data.repository.FieldRepo
import com.boot.data.repository.JobRepo
import com.boot.data.repository.QualificationRepo
import com.boot.data.repository.SkillRepo
import com.boot.data.repository.SpecializationRepo
import com.boot.data.repository.StateRepo
import com.boot.data.repository.UserRepo
import com.boot.exception.NoPrincipalUserFound
import com.boot.helper.AuthenticationUtil

import groovy.transform.TypeChecked;

import groovy.transform.CompileStatic;

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
	@Autowired CandidateApplicationRepo candidateApplicationRepo
	@Autowired EmployerRepo employerRepo

	@RequestMapping(method=RequestMethod.GET)
	public String candidate(Model model, HttpSession session) throws NoPrincipalUserFound{
		Candidate candidate = getPrincipalCandidate();
		def jobs = jobRepo.findAll()
		def applied = candidateApplicationRepo.findByCandidateId(candidate.getId()).collect{ it.job.id }
		println "aweaweawe + " + applied.size()
		jobs = jobs.findAll{
			!applied.contains(it.id)
		}
		
		logger.info(candidate.toString())
		model.addAttribute('countries', countryRepo.findAll())
		model.addAttribute('states', stateRepo.findAll())
		model.addAttribute('principal', candidate);
		model.addAttribute('jobs', jobs)
		model.addAttribute('skills', skillRepo.findAll())
		return "candidate";
	}

	@RequestMapping(params='search')
	public String candidateSearch(Model model,
			@RequestParam('search') String search,
			HttpSession session){
		Candidate candidate = getPrincipalCandidate();
		model.addAttribute('principal', candidate);
		def jobs = jobRepo.findByNameLikeIgnoreCaseOrDescriptionLikeIgnoreCase(search,search)
		def applied = candidateApplicationRepo.findByCandidateId(candidate.getId()).collect{ it.job.id }
		println "aweaweawe + " + applied.size()
		jobs = jobs.findAll{
			!applied.contains(it.id)
		}
		
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
		model.addAttribute('principal', getPrincipalCandidate());
		return "candidate/edit-candidate";
	}

	// TODO add validation
	@RequestMapping(value="savePersonalInformation", method=RequestMethod.POST)
	public String savePersonalInformation(Model model,
			@RequestParam(name="firstName", required=false) String firstName,
			@RequestParam(name="lastName", required=false) String lastName,
			@RequestParam(name="birthdate", required=false) String birthdate,
			@RequestParam(name="state", required=false) String state,
			@RequestParam(name="contact", required=false) String contact,
			@RequestParam(name="address", required=false) String address) throws NoPrincipalUserFound{

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
			def dcountry = countryRepo.findOne(dstate.countryId)
			candidate.location.state = dstate
			candidate.location.country = dcountry
		}
		if(address) candidate.address = address
		logger.info "Updating candidate ${candidate}"
		candidateRepo.save(candidate);
		return "redirect:/candidate/edit?success";
	}
			
	@RequestMapping(value="saveEducation", method=RequestMethod.POST)
	public String saveEducation(Model model,
		@RequestParam(value='highschool-year', required=false) String hsYear,
		@RequestParam(value='highschool-name', required=false) String hsName,
		@RequestParam(value='college-year', required=false) String cYear,
		@RequestParam(value='college-name', required=false) String cName,
		@RequestParam(value='college-course', required=false) String cCourse){
		Candidate candidate = getPrincipalCandidate();
		if(hsYear && hsName){
			candidate.highSchool = new Education(school: hsName, startYear: hsYear.split('-')[0],
				endYear: hsYear.split('-')[1])
		}
		if(cYear && cName && cCourse){
			candidate.college = new Education(school: cName, startYear: cYear.split('-')[0],
				endYear: cYear.split('-')[1], course: cCourse)
		}
		candidateRepo.save(candidate);
		return "redirect:/candidate/edit?success";
	}
		
	@RequestMapping(value="saveExperience", method=RequestMethod.POST)
	public String saveExperience(Model model,
		@RequestParam(value="experience-year", required=false) String[] years,
		@RequestParam(value="experience-position", required=false) String[] positions,
		@RequestParam(value="experience-company-name", required=false) String[] companies,
		@RequestParam(value="experience-role", required=false) String[] roles){
		Candidate candidate = getPrincipalCandidate();
		candidate.experiences = []
		for(int x = 0; x < years.size() ; x++){
			String year = years[x]
			String position = positions[x]
			String company = companies[x]
			String role = roles[x]
			candidate.experiences << new Experience(startYear: year.split('-')[0], endYear: year.split('-')[1],
				position: position, companyName: company, role: role)
		}
		candidateRepo.save(candidate);
		return "redirect:/candidate/edit?success";
	}
		
	@RequestMapping(value="saveOther", method=RequestMethod.POST)
	public String saveOtherInfo(Model model,
		@RequestParam(value="about", required=false) String about,
		@RequestParam(value="objective", required=false) String objective){
		Candidate candidate = getPrincipalCandidate();
		candidate.about = about
		candidate.objective = objective
		candidateRepo.save(candidate);
		return "redirect:/candidate/edit?success";
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
		return "redirect:/candidate/edit?success";
	}

	@RequestMapping(value="addResume", method=RequestMethod.GET)
	public String addResume(@RequestParam(value='edit', required=false) Boolean edit){
		return "resume/selection"
	}

	@RequestMapping(value="/{id}/resume", method=RequestMethod.GET)
	public String addResumePost(Model model,
		@PathVariable('id') String id){
		Candidate candidate = candidateRepo.findOne(id)
		if(!candidate.resumeName){
			return "redirect:/candidate/addResume"
		}
		model.addAttribute('candidate', candidate)
		model.addAttribute('principal', candidate)
		return "/resume/${candidate.resumeName}/main"
	}
	
	@RequestMapping(value="resume/save", method=RequestMethod.POST)
	public String saveResume(HttpServletRequest request,
		@RequestParam('resume') String resume){
		Candidate candidate = getPrincipalCandidate()
		candidate.resumeName = resume
		candidateRepo.save(candidate)
		return "redirect:/candidate/${candidate.id}/resume"
	}
	
	@RequestMapping(value="reset", method=RequestMethod.GET)
	public @ResponseBody String resetResume(Model model){
		Candidate candidate = getPrincipalCandidate()
		candidate.resumeName = ""
		candidate.resumeParams = null
		candidateRepo.save(candidate)
		return "resume/resume1"
	}

	@RequestMapping(value="resume", method=RequestMethod.GET)
	public String resume(Model model){
		Candidate candidate = getPrincipalCandidate()
		model.addAttribute("candidate", candidate)
		return "/resume/${candidate.resumeName}/main"
	}

	@RequestMapping(value="editResume", method=RequestMethod.GET)
	public String editResume(Model model){
		Candidate candidate = getPrincipalCandidate()

		return "resume/resume1-output"
	}
	
	
	@RequestMapping(value="jobApplication", method=RequestMethod.GET)
	public String jobApplication(Model model){
		def candidate =  getPrincipalCandidate()
		def jobs = candidateApplicationRepo.findByCandidateId(candidate.id)
		model.addAttribute("applications",jobs)
		model.addAttribute("principal", candidate)
		return "candidate/job-applications"
	}
	
	@RequestMapping(value="/profileUpload", method=RequestMethod.POST)
	public String handleFileUpload(
		@RequestParam("file") MultipartFile file,
		@RequestParam("id") String id){
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				BufferedOutputStream stream =
						new BufferedOutputStream(new FileOutputStream(new File("src/main/webapp/resources/images/profiles/${id}.png")));
				stream.write(bytes);
				stream.close();
			} catch (Exception e) {
				e.printStackTrace()
			}
		}
		def candidate = getPrincipalCandidate()
		candidate.hasPicture = true
		candidateRepo.save(candidate)
		return "redirect:/candidate"
	}
		
	@RequestMapping(value="/activate/{id}")
	public String activateAccount(
		@PathVariable("id") String id){
		def candidate = candidateRepo.findOne(id)
		if(candidate.user.enabled){
			return "404"
		}
		candidate.user.enabled = true
		userRepo.save(candidate.user)
		return "redirect:/login?activated"
	}
		
	@RequestMapping(value="/changeEmail")
	public String changeEmail(@RequestParam('email') String email){
		def candidate = getPrincipalCandidate()
		def user = userRepo.findByEmail(email)
		if(user){
			return "redirect:/candidate/edit?emailNotAvailable"
		}
		candidate.user.email = email
		userRepo.save(candidate.user)
		return "redirect:/candidate/edit?success"
	}
	
	@RequestMapping(value="/changePassword")
	public String changePassword(@RequestParam('password') String password){
		def candidate = getPrincipalCandidate()
		candidate.user.password = password
		userRepo.save(candidate.user)
		return "redirect:/candidate/edit?success"
	}
	
	@RequestMapping(value="/c/{id}")
	public String viewEmployer(
			@PathVariable("id") String customerId,
			Model model
		){
		model.addAttribute("employer", employerRepo.findOne(customerId))
		model.addAttribute("principal", getPrincipalCandidate())
		return "candidate/view-employer"
	}
		
	@RequestMapping(value="/advance")
	public String advanceSearch(
		Model model, 
		@RequestParam Map<String,String> params,
		@RequestParam(required=false) List<String> skills){
		Candidate candidate = getPrincipalCandidate();
		def jobs = jobRepo.findByType(params.type)
		jobs = jobs.findAll{
			it.location.state.id == params.state
		}
		jobs = jobs.findAll{
			!Collections.disjoint(it.skills.collect{ it.id } , skills);
		}
		def applied = candidateApplicationRepo.findByCandidateId(candidate.getId()).collect{ it.job.id }
		jobs = jobs.findAll{
			!applied.contains(it.id)
		}
		
		logger.info(candidate.toString())
		model.addAttribute('countries', countryRepo.findAll())
		model.addAttribute('states', stateRepo.findAll())
		model.addAttribute('principal', candidate);
		model.addAttribute('jobs', jobs)
		model.addAttribute('skills', skillRepo.findAll())
		model.addAttribute("asearch", ['state' : params.state, 'skills' : skills, type: params.type])
		return "candidate";
	}

	private Candidate getPrincipalCandidate(){
		String principalUser = AuthenticationUtil.getPrincipal();
		def user = userRepo.findByUsername(principalUser)
		def candidate = candidateRepo.findByUserId(user.id)
		return candidate
	}
}
