package com.boot.controller;

import java.text.SimpleDateFormat

import javax.servlet.http.HttpSession

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.mongodb.core.query.Criteria
import org.springframework.data.mongodb.core.query.Query
import org.springframework.data.mongodb.gridfs.GridFsTemplate
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.validation.Errors
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.multipart.MultipartFile

import com.boot.data.entity.CandidateApplication
import com.boot.data.entity.Country
import com.boot.data.entity.Employer
import com.boot.data.entity.Industry
import com.boot.data.entity.Job
import com.boot.data.entity.Location
import com.boot.data.entity.State
import com.boot.data.repository.CandidateApplicationRepo
import com.boot.data.repository.CandidateRepo
import com.boot.data.repository.CountryRepo
import com.boot.data.repository.FieldRepo
import com.boot.data.repository.IndustryRepo
import com.boot.data.repository.JobRepo
import com.boot.data.repository.QualificationRepo
import com.boot.data.repository.SkillRepo
import com.boot.data.repository.SpecializationRepo
import com.boot.data.repository.StateRepo
import com.boot.data.repository.UserRepo
import com.boot.helper.AuthenticationUtil
import com.boot.helper.MailMail
import com.mongodb.BasicDBObject
import com.mongodb.DBObject

@Controller
@RequestMapping("/employer")
public class EmployerController {

	private static final Logger logger = LoggerFactory.getLogger(EmployerController.class);

	@Autowired UserRepo userRepo
	@Autowired CandidateRepo candidateRepo
	@Autowired QualificationRepo qualificationRepo
	@Autowired FieldRepo fieldRepo
	@Autowired SpecializationRepo specializationRepo
	@Autowired SkillRepo skillRepo
	@Autowired CountryRepo countryRepo
	@Autowired StateRepo stateRepo
	@Autowired JobRepo jobRepo
	@Autowired EmployerRepo employerRepo
	@Autowired IndustryRepo industryRepo
	@Autowired GridFsTemplate gridFs
	@Autowired MailMail mail
	@Autowired CandidateApplicationRepo candidateAppRepo

	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register(Model model, HttpSession session) {
		if(!model.containsAttribute('employerRegistration')){
			model.addAttribute('employerRegistration', new Employer())
		}
		return "employer/register"
	}

	@RequestMapping(value="/profilePicture/{id}", method = RequestMethod.GET, produces = "image/png")
	@ResponseBody
	public byte[] getProfile(
			@PathVariable("id") String id
	){
		def file = gridFs.findOne(new Query(Criteria.where("_id").is(id)));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		file.writeTo(baos);
		byte[] bytes = baos.toByteArray();
		println bytes.length
		return bytes;
	}

	@RequestMapping(value="register", method=RequestMethod.POST)
	public String registerPost(Model model,
			HttpSession session,
			@ModelAttribute Employer employer,
			Errors errors) {

		if(userRepo.findByEmail(employer.user.email)){
			errors.rejectValue("user.email", "", "Email already exist");
		}

		if(errors.hasErrors()){
			model.addAttribute("errors", errors.getFieldErrors());
			if(!model.containsAttribute('employerRegistration')){
				model.addAttribute('employerRegistration', new Employer())
			}
			return "employer/register";
		}

		employer.user.username = employer.user.email
		employer.user.role = "ROLE_EMPLOYER"
		employer.user.enabled = false
		userRepo.insert(employer.user)
		employerRepo.insert(employer)

		mail.sendMail("DHVTSU-CAREERS", employer.user.email ,"Account Activation",
				"To activate your account please click the activation link http://localhost:8080/employer/activate/${employer.id}");
		return "redirect:/login?success"
	}

	@RequestMapping(value="/activate/{id}")
	public String activateAccount(
			@PathVariable("id") String id){
		def employer = employerRepo.findOne(id)

		if(employer.user.enabled){
			return "404"
		}

		employer.user.enabled = true
		userRepo.save(employer.user)
		return "redirect:/login?activated"
	}

	@RequestMapping
	public String employer(HttpSession session, Model model){
		def employer = getPrincipalEmployer()
		session.setAttribute('principal',employer)
		def jobs = jobRepo.findByEmployerId(employer.id);
		if(jobs.size() > 3)
			jobs = jobs.subList(0,2)
		model.addAttribute('jobs', jobs)
		return "employer/employer"
	}

	@RequestMapping(value="postJob")
	public String postJob(HttpSession session, Model model){
		model.addAttribute('skills', skillRepo.findAll())
		if(!model.containsAttribute('formJobPosting')){
			model.addAttribute('formJobPosting', new Job())
		}
		model.addAttribute('countries', countryRepo.findAll())
		return "employer/post-job"
	}

	@RequestMapping(value="postJob", method=RequestMethod.POST)
	public String receiveJob(HttpSession session,
			Model model,
			@RequestParam(name="title") String title,
			@RequestParam(name="salary") String salary,
			@RequestParam(name="stateId") String stateId,
			@RequestParam(name="skills") List<String> skills,
			@RequestParam(name="expiry") String expiry,
			@RequestParam(name="description") String description,
			@RequestParam(name="type") String type,
			@RequestParam(name="experience") String experience){
		State state = stateRepo.findOne(stateId)
		Country country = countryRepo.findOne(state.countryId)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		def mySkills = []
		skills.each{
			mySkills << skillRepo.findOne(it)
		}
		def job = new Job(name: title, location: new Location(country: country, state: state),
		description: description, posted: new Date(),
		expiry:sdf.parse(expiry), salaryFrom: salary.split('-')[0] as long, salaryTo: salary.split('-')[1] as long,
		skills: mySkills, employer: getPrincipalEmployer(), type: type,
		experienceFrom: experience.split('-')[0] as int, experienceTo: experience.split('-')[1] as int)
		jobRepo.save(job)

		def candidates = candidateRepo.findAll();
		candidates = candidates.findAll{
			!Collections.disjoint(it.skills.collect{ it.id } , skills);
		}
		println "Size Match : ${candidates.size()}"
		candidates.each{
			mail.sendMail("DHVTSU-CAREERS", it.user.email,"Job notification",
					"Hello ${it.firstName} there is a new job that match your skills http://localhost:8080/job/${job.id}");
		}

		return "redirect:/employer?success"
	}

	@RequestMapping(value="edit")
	public String editEmployer(HttpSession session, Model model){
		session.setAttribute('principal', getPrincipalEmployer())
		model.addAttribute('industries',industryRepo.findAll())
		model.addAttribute('countries', countryRepo.findAll())
		return "employer/edit-employer"
	}

	@RequestMapping(value="edit", method = RequestMethod.POST)
	public String editEmployerSave(HttpSession session,
			Model model,
			@RequestParam(name='industries', required = false) List<Industry> industries,
			@RequestParam(name='companySize', required = false) Long companySize,
			@RequestParam(name='companyOverview', required = false) String companyOverview,
			@RequestParam(name='state', required = false) String stateId){
		def employer = getPrincipalEmployer()
		employer.industries = industries
		if(companySize) employer.size = companySize
		if(companyOverview) employer.overview = companyOverview
		if(stateId){
			def state = stateRepo.findOne(stateId)
			def country = countryRepo.findOne(state.countryId)
			def loc = new Location(state: state, country: country)
			employer.location = loc
		}
		employerRepo.save(employer)
		return "redirect:edit"
	}

	@RequestMapping(value="/profileUpload", method=RequestMethod.POST)
	public String handleFileUpload(
			@RequestParam("file") MultipartFile file,
			@RequestParam("id") String id){
		def employer = getPrincipalEmployer()
		if (!file.isEmpty()) {
			try {
				DBObject metaData = new BasicDBObject();
				metaData.put("userId", id);
				def picture = gridFs.store(file.getInputStream(), "${id}.png", "profiles", metaData);
				employer.pictureId = picture.getId()
			} catch (Exception e) {
				e.printStackTrace()
			}
		}

		employer.hasPicture = true
		employerRepo.save(employer)
		return "redirect:/employer"
	}

	@RequestMapping(value="/job/edit/{id}", method=RequestMethod.GET)
	public String editJob(
			Model model,
			@PathVariable("id") String id
	){
		model.addAttribute('skills', skillRepo.findAll())
		if(!model.containsAttribute('formJobPosting')){
			model.addAttribute('formJobPosting', new Job())
		}
		model.addAttribute('countries', countryRepo.findAll())
		def job = jobRepo.findOne(id)
		if(job == null)
			return "404"
		model.addAttribute('job', job)
		model.addAttribute('applicants', candidateAppRepo.findByJobId(id).collect{ it.candidate } )
		return "employer/edit-job"
	}

	@RequestMapping(value="/job/delete/{id}", method=RequestMethod.GET)
	public String deleteJob(
			Model model,
			@PathVariable("id") String id
	){
		jobRepo.delete(id);
		return "redirect:/employer?deleted"
	}

	@RequestMapping(value="/job/{jobId}/{id}", method=RequestMethod.GET)
	public String showCandidate(
			Model model,
			@PathVariable("id") String id,
			@PathVariable("jobId") String jobId
	){
		model.addAttribute('candidate',candidateRepo.findOne(id))
		model.addAttribute('job', jobRepo.findOne(jobId))
		return "employer/candidate-profile"
	}
	
	@RequestMapping(value="/job/{jobId}/{id}/resume", method=RequestMethod.GET)
	public String showCandidateResume(
			Model model,
			@PathVariable("id") String id,
			@PathVariable("jobId") String jobId
	){
		def candidate = candidateRepo.findOne(id)
		model.addAttribute('candidate',candidate)
		def app = candidateAppRepo.findByJobIdAndCandidateId(jobId, id)
		app.viewCount = app.viewCount + 1
		candidateAppRepo.save(app)
		return "/resume/${candidate.resumeName}/main-employer"
	}
	
	@RequestMapping(value="/job/{jobId}/{id}/mainresume", method=RequestMethod.GET)
	public String showCandidateMainResume(
			Model model,
			@PathVariable("id") String id,
			@PathVariable("jobId") String jobId
	){
		def candidate = candidateRepo.findOne(id)
		model.addAttribute('candidate',candidate)
		CandidateApplication app = candidateAppRepo.findByJobIdAndCandidateId(jobId, id)
		app.viewCount = app.viewCount + 1
		candidateAppRepo.save(app)
		return "/employer/mainresume"
	}

	private Employer getPrincipalEmployer(){
		String principalUser = AuthenticationUtil.getPrincipal();
		def user = userRepo.findByUsername(principalUser)
		def employer = employerRepo.findByUserId(user.id)
		return employer
	}
}
