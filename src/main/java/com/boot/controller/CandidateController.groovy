package com.boot.controller;

import java.text.SimpleDateFormat

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.mongodb.core.query.Criteria
import org.springframework.data.mongodb.core.query.Query
import org.springframework.data.mongodb.gridfs.GridFsTemplate
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.multipart.MultipartFile

import com.boot.data.entity.Candidate
import com.boot.data.entity.Document
import com.boot.data.entity.Education
import com.boot.data.entity.Experience
import com.boot.data.entity.Location
import com.boot.data.entity.Skill
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
import com.boot.helper.MailMail
import com.mongodb.BasicDBObject
import com.mongodb.DBObject

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
	@Autowired GridFsTemplate gridFs;
	@Autowired MailMail mail;

	static final boolean DEBUG = true
	static final int PAGE_SIZE = 5

	@RequestMapping(method=RequestMethod.GET)
	public String candidate(Model model, HttpSession session,
			@RequestParam(name="page", required=false) Integer page) throws NoPrincipalUserFound{
		Candidate candidate = getPrincipalCandidate();

		if(page == null)
			page = 1

		def jobs = jobRepo.findByExpired(false)
		def applied = candidateApplicationRepo.findByCandidateId(candidate.getId()).collect{ it.job.id }
		jobs = jobs.findAll{
			!applied.contains(it.id)
		}

		model.addAttribute('jobSize', jobs.size())
		jobs = jobs.toSorted{ a,b -> b.posted <=> a.posted }
		println "Jobs Size : ${jobs.size()}"

		if(jobs.size() >= PAGE_SIZE){
			if(jobs.size() < (page * PAGE_SIZE)){
				jobs = jobs.subList( (page*PAGE_SIZE) - PAGE_SIZE, jobs.size())
			}else{
				jobs = jobs.subList( (page*PAGE_SIZE) - PAGE_SIZE, (page * PAGE_SIZE))
			}
		}

		model.addAttribute('countries', countryRepo.findAll())
		model.addAttribute('states', stateRepo.findAll())
		model.addAttribute('principal', candidate);
		model.addAttribute('jobs', jobs)
		model.addAttribute('skills', skillRepo.findAll())

		session.setAttribute('principal', candidate)

		return "candidate";
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

	@RequestMapping(params='search')
	public String candidateSearch(Model model,
			@RequestParam('search') String search,
			HttpSession session,
			@RequestParam(name="page", required=false) Integer page){
		Candidate candidate = getPrincipalCandidate();
		model.addAttribute('principal', candidate);

		if(page == null)
			page = 1

		def jobs = jobRepo.findByNameLikeIgnoreCaseOrDescriptionLikeIgnoreCaseOrLocationStateNameLikeIgnoreCaseOrLocationCountryNameLikeIgnoreCase(search,search,search,search)
		def emp = employerRepo.findByCompanyNameLikeIgnoreCase(search)
		def jobs2 = []
		emp.each{
			jobs2 = jobs2 + jobRepo.findByEmployerId(it.id)
		}
		jobs = jobs + jobs2
		jobs = jobs.findAll{ it.expired == false }
		def applied = candidateApplicationRepo.findByCandidateId(candidate.getId()).collect{ it.job.id }
		jobs = jobs.findAll{
			!applied.contains(it.id)
		}

		model.addAttribute('jobSize', jobs.size())
		println "Jobs Size : ${jobs.size()}"

		if(jobs.size() >= PAGE_SIZE){
			if(jobs.size() < (page * PAGE_SIZE)){
				jobs = jobs.subList( (page*PAGE_SIZE) - PAGE_SIZE, jobs.size())
			}else{
				jobs = jobs.subList( (page*PAGE_SIZE) - PAGE_SIZE, (page * PAGE_SIZE))
			}
		}

		model.addAttribute('jobs', jobs)
		model.addAttribute('search', search)
		model.addAttribute('countries', countryRepo.findAll())
		model.addAttribute('states', stateRepo.findAll())
		model.addAttribute('principal', candidate);
		model.addAttribute('jobs', jobs)
		model.addAttribute('skills', skillRepo.findAll())

		return "candidate";
	}

	@RequestMapping(value="edit", method=RequestMethod.GET)
	public String editCandidate(Model model, HttpSession session) throws NoPrincipalUserFound{
		model.addAttribute("qualifications", qualificationRepo.findAll())
		model.addAttribute("fieldOfStudies", fieldRepo.findAll())
		model.addAttribute("specializations", specializationRepo.findAll())
		model.addAttribute("skills", skillRepo.findAll())
		model.addAttribute("countries", countryRepo.findAll())
		model.addAttribute("states", stateRepo.findAll())
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
			@RequestParam(name="contactNumber", required=false) String contact,
			@RequestParam(name="address", required=false) String address,
			@RequestParam(name="resstate", required=false) String resstate,
			@RequestParam(name="resaddress", required=false) String resaddress) throws NoPrincipalUserFound{

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
		
		if(!candidate.residenceLocation)
			candidate.residenceLocation = new Location()
		def resdstate = stateRepo.findOne(resstate)
		def reddcountry = countryRepo.findOne(resdstate.countryId)
		candidate.residenceLocation.state = resdstate
		candidate.residenceLocation.country = reddcountry
		candidate.residenceAddress = resaddress
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
			@RequestParam(value="experience-year[]", required=false) List<String> years,
			@RequestParam(value="experience-position[]", required=false) List<String> positions,
			@RequestParam(value="experience-company-name[]", required=false) List<String> companies,
			@RequestParam(value="experience-role[]", required=false) List<String> roles){
		Candidate candidate = getPrincipalCandidate();
		candidate.experiences = []
		if(years)
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
				def s = skillRepo.findByName(it)
				if(s == null){
					s = new Skill(name: it)
					skillRepo.save(s)
				}
				candidate.skills.add(s)
			}
		}else{

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
	public String addResume(@RequestParam(value='edit', required=false) Boolean edit,
			Model model){
		model.addAttribute('principal', getPrincipalCandidate())
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
		def candidate = getPrincipalCandidate()
		if (!file.isEmpty()) {
			try {
				DBObject metaData = new BasicDBObject();
				metaData.put("userId", id);
				def picture = gridFs.store(file.getInputStream(), "${id}.png", "profiles", metaData);
				candidate.pictureId = picture.getId()
			} catch (Exception e) {
				e.printStackTrace()
			}
		}

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
			@RequestParam(required=false) List<String> skills,
			@RequestParam(name="page", required=false) Integer page){

		if(page == null)
			page = 1

		Candidate candidate = getPrincipalCandidate();
		def jobs = jobRepo.findByType(params.type)
		jobs = jobs.findAll{ it.expired == false }
		println "Type : ${jobs.size()}"

		if(params.country != 'all'){
			jobs = jobs.findAll{
				it.location.state.id == params.state
			}
		}

		println "State : ${jobs.size()}"

		if(!skills.contains('all') && skills.size() != 0){
			jobs = jobs.findAll{
				!Collections.disjoint(it.skills.collect{ it.name } , skills);
			}
		}

		def applied = candidateApplicationRepo.findByCandidateId(candidate.getId()).collect{ it.job.id }
		jobs = jobs.findAll{
			!applied.contains(it.id)
		}

		println jobs.size()

		model.addAttribute('countries', countryRepo.findAll())
		model.addAttribute('states', stateRepo.findAll())
		model.addAttribute('principal', candidate);

		model.addAttribute('jobSize', jobs.size())
		println "Jobs Size : ${jobs.size()}"

		if(jobs.size() >= PAGE_SIZE){
			if(jobs.size() < (page * PAGE_SIZE)){
				jobs = jobs.subList( (page*PAGE_SIZE) - PAGE_SIZE, jobs.size())
			}else{
				jobs = jobs.subList( (page*PAGE_SIZE) - PAGE_SIZE, (page * PAGE_SIZE))
			}
		}

		model.addAttribute('jobs', jobs)

		model.addAttribute('skills', skillRepo.findAll())
		model.addAttribute("asearch", ['state' : params.state, 'skills' : skills, type: params.type])
		return "candidate";
	}

	@RequestMapping(value="/uploadResume", method=RequestMethod.POST)
	public String handleUploadResume(
			@RequestParam("file") MultipartFile file,
			@RequestParam("id") String id){
		def candidate = getPrincipalCandidate()
		if (!file.isEmpty()) {
			try {
				DBObject metaData = new BasicDBObject();
				metaData.put("userId", id);
				println "CONTENT : ${file.getOriginalFilename().matches(/^.*\.(pdf|PDF)$/)}"
				if(file.getOriginalFilename().matches(/^.*\.(pdf|PDF)$/))
					candidate.resumeIsViewable = true
				else
					candidate.resumeIsViewable = false
				def resume = gridFs.store(file.getInputStream(), file.getOriginalFilename() , "resumes", metaData);
				candidate.resumeId = resume.getId()
				candidate.realResumeName = file.getOriginalFilename()
			} catch (Exception e) {
				e.printStackTrace()
			}
		}
		candidateRepo.save(candidate)
		return "redirect:/candidate"
	}

	@RequestMapping(value="/{id}/myresume", method = RequestMethod.GET, produces = "application/pdf")
	@ResponseBody
	public byte[] getResume(
			@PathVariable("id") String id
	){
		def candidate = candidateRepo.findOne(id);
		def file = gridFs.findOne(new Query(Criteria.where("_id").is(candidate.resumeId)));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		file.writeTo(baos);
		byte[] bytes = baos.toByteArray();
		return bytes;
	}

	@RequestMapping(value="/{id}/myresumedocx", method = RequestMethod.GET, produces = "application/doc")
	@ResponseBody
	public byte[] getResumeDocx(
			@PathVariable("id") String id
	){
		def candidate = candidateRepo.findOne(id);
		def file = gridFs.findOne(new Query(Criteria.where("_id").is(candidate.resumeId)));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		file.writeTo(baos);
		byte[] bytes = baos.toByteArray();
		return bytes;
	}

	@RequestMapping(value="/{id}/myresume/display", method = RequestMethod.GET)
	public String displayResume(
			@PathVariable("id") String id,
			Model model
	){
		def candidate = candidateRepo.findOne(id);
		model.addAttribute('principal', candidate)
		return "candidate/mainresume";
	}

	@RequestMapping(value="/changeEmail/{id}")
	public String changeEmail(
			@PathVariable("id") String id,
			Model model){
		def user = userRepo.findOne(id)
		if(user == null)
			return "404"
		mail.sendMail("DHVTSU-CAREERS", user.getEmail(),"Change Email",
				"To change your email go to this link http://localhost:8080/changeEmail/" + user.getId());
		return "redirect:/candidate/edit?changeEmail"
	}

	@RequestMapping(value="/changePassword/{id}")
	public String changePassword(
			@PathVariable("id") String id,
			Model model){
		def user = userRepo.findOne(id)
		if(user == null)
			return "404"
		mail.sendMail("DHVTSU-CAREERS", user.getEmail(),"Change Password",
				"To change your password go to this link http://localhost:8080/changePassword/" + user.getId());
		return "redirect:/candidate/edit?changeEmail"
	}

	@RequestMapping(value="/uploadDocuments", method=RequestMethod.POST)
	public String handleUploadDocuments(
			@RequestParam("file") MultipartFile file,
			@RequestParam("id") String id){
		def candidate = getPrincipalCandidate()
		if (!file.isEmpty()) {
			try {
				DBObject metaData = new BasicDBObject();
				metaData.put("userId", id);
				def resume = gridFs.store(file.getInputStream(), file.getOriginalFilename() , "documents", metaData);

				if(!candidate.documents)
					candidate.documents = []
				candidate.documents << resume.getId()
			} catch (Exception e) {
				e.printStackTrace()
			}
		}
		candidateRepo.save(candidate)
		return "redirect:/candidate/edit"
	}

	@RequestMapping(value="/document/{docId}", method = RequestMethod.GET, produces = "image/*")
	@ResponseBody
	public byte[] getDocuments(
			@PathVariable("docId") String docId
	){
		def file = gridFs.findOne(new Query(Criteria.where("_id").is(docId)));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		file.writeTo(baos);
		byte[] bytes = baos.toByteArray();
		return bytes;
	}

	@RequestMapping(value="/uploadLegal", method=RequestMethod.POST)
	public String handleUploadLegal(
			@RequestParam("file") MultipartFile file,
			@RequestParam("id") String id){
		def candidate = getPrincipalCandidate()
		if (!file.isEmpty()) {
			try {
				DBObject metaData = new BasicDBObject();
				metaData.put("userId", id);
				def resume = gridFs.store(file.getInputStream(), file.getOriginalFilename() , "legal", metaData);
				candidate.legal << new Document(id : resume.getId(), name: file.getOriginalFilename())
			} catch (Exception e) {
				e.printStackTrace()
			}
		}
		candidateRepo.save(candidate)
		return "redirect:/candidate/edit"
	}

	@RequestMapping(value="/legal/{legalId}", method = RequestMethod.GET, produces = "application/octet-stream")
	@ResponseBody
	public byte[] getLegal(
			@PathVariable("legalId") String legalId
	){
		def file = gridFs.findOne(new Query(Criteria.where("_id").is(legalId)));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		file.writeTo(baos);
		byte[] bytes = baos.toByteArray();
		return bytes;
	}
	
	@RequestMapping("/edit/personal")
	public String setPersonal(Model model){
		model.addAttribute('countries', countryRepo.findAll())
		model.addAttribute('principal', getPrincipalCandidate());
		return "/candidate/personal"
	}
	
	@RequestMapping("/edit/documents")
	public String setDocuments(Model model){
		model.addAttribute('principal', getPrincipalCandidate());
		return "/candidate/documents"
	}
	
	@RequestMapping("/edit/professional")
	public String setProfessional(Model model){
		model.addAttribute('qualifications', qualificationRepo.findAll())
		model.addAttribute('fieldOfStudies', fieldRepo.findAll())
		model.addAttribute('specializations', specializationRepo.findAll())
		model.addAttribute('skills', skillRepo.findAll())
		model.addAttribute('principal', getPrincipalCandidate());
		return "/candidate/professional"
	}
	
	@RequestMapping("/edit/education")
	public String setEducation(Model model){
		model.addAttribute('principal', getPrincipalCandidate());
		return "/candidate/education"
	}
	
	@RequestMapping("/edit/others")
	public String setOthers(Model model){
		model.addAttribute('principal', getPrincipalCandidate());
		return "/candidate/others"
	}

	private Candidate getPrincipalCandidate(){
		String principalUser = AuthenticationUtil.getPrincipal();
		def user = userRepo.findByUsername(principalUser)
		def candidate = candidateRepo.findByUserId(user.id)
		return candidate
	}
}
