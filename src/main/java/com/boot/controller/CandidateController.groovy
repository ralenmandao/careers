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

	@RequestMapping(method=RequestMethod.GET)
	public String candidate(Model model, HttpSession session) throws NoPrincipalUserFound{
		Candidate candidate = getPrincipalCandidate();
		def jobs = jobRepo.findAll()
		logger.info(candidate.toString())
		model.addAttribute('principal', candidate);
		model.addAttribute('jobs', jobs)
		return "candidate";
	}

	@RequestMapping(params='search')
	public String candidateSearch(Model model,
			@RequestParam('search') String search,
			HttpSession session){
		Candidate candidate = getPrincipalCandidate();
		model.addAttribute('principal', candidate);
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
		return "redirect:/candidate/edit";
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
		return "redirect:/candidate/edit";
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
		return "redirect:/candidate/edit";
	}
		
	@RequestMapping(value="saveOther", method=RequestMethod.POST)
	public String saveOtherInfo(Model model,
		@RequestParam(value="about", required=false) String about,
		@RequestParam(value="objective", required=false) String objective){
		Candidate candidate = getPrincipalCandidate();
		candidate.about = about
		candidate.objective = objective
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
		def jobs = candidateApplicationRepo.findByCandidateId(candidate.id).collect{ it.job }
		model.addAttribute("jobs",jobs)
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
		candidate.user.enabled = true
		userRepo.save(candidate.user)
		return "redirect:/login?activated"
	}

		
	private Resume1 processResume1Param(def map){
		Resume1 resume = new Resume1();
		def hsYear = map['highschool-year'][0]
		resume.hs = [startYear: hsYear.split('-')[0], endYear: hsYear.split('-')[1], school: map['highschool-name'][0]]
		def cYear = map['college-year'][0]
		resume.college = [startYear: cYear.split('-')[0], endYear: cYear.split('-')[1], school: map['college-name'][0]]
		for(int x = 0; x < map['experience-year'].size(); x++){
			def eYear = map['experience-year'][x].toString()
			resume.experience << [startYear: eYear.split('-')[0], endYear: eYear.split('-')[1], position: map['experience-position'][x],
				companyName: map['experience-company-name'][x], role: map['experience-role'][x]]
		}
		resume.about = map['about'][0]
		resume.objective = map['objective'][0]
		resume
	}
		
	private Candidate getPrincipalCandidate(){
		String principalUser = AuthenticationUtil.getPrincipal();
		def user = userRepo.findByUsername(principalUser)
		def candidate = candidateRepo.findByUserId(user.id)
		return candidate
	}
}
