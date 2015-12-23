package com.boot.controller

import java.text.SimpleDateFormat

import javax.servlet.http.HttpSession

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

import com.boot.data.entity.Admin
import com.boot.data.entity.Country
import com.boot.data.entity.FieldOfStudy
import com.boot.data.entity.Industry
import com.boot.data.entity.Location
import com.boot.data.entity.Qualification
import com.boot.data.entity.Skill
import com.boot.data.entity.Specialization
import com.boot.data.entity.State
import com.boot.data.repository.AdminRepo
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
import com.boot.exception.NoPrincipalUserFound
import com.boot.helper.AuthenticationUtil

@Controller
@RequestMapping('/admin')
class AdminController {

	@Autowired UserRepo userRepo
	@Autowired AdminRepo adminRepo
	@Autowired QualificationRepo qualificationRepo
	@Autowired FieldRepo fieldRepo
	@Autowired SpecializationRepo specializationRepo
	@Autowired SkillRepo skillRepo
	@Autowired CountryRepo countryRepo
	@Autowired StateRepo stateRepo
	@Autowired JobRepo jobRepo
	@Autowired CandidateApplicationRepo candidateApplicationRepo
	@Autowired CandidateRepo candidateRepo
	@Autowired EmployerRepo employerRepo
	@Autowired IndustryRepo industryRepo

	@RequestMapping(method=RequestMethod.GET)
	public String admin(HttpSession session){
		def admin = getPrincipalAdmin()
		session.setAttribute('principal', admin)
		return "admin/admin"
	}

	@RequestMapping(value="edit", method=RequestMethod.GET)
	public String edit(HttpSession session){
		return "admin/edit"
	}

	@RequestMapping(value="edit",method=RequestMethod.POST)
	public String adminPost(HttpSession session,
			@RequestParam('firstName') String firstName,
			@RequestParam('lastName') String lastName){
		def admin = getPrincipalAdmin()
		if(firstName) admin.firstName = firstName
		if(lastName) admin.lastName = lastName
		adminRepo.save(admin)
		session.setAttribute('principal', admin)
		return "redirect:edit"
	}

	@RequestMapping(value="candidates", method=RequestMethod.GET)
	public String candidates(HttpSession session,
			Model model){
		model.addAttribute('candidates',candidateRepo.findAll())
		return "admin/candidates"
	}

	@RequestMapping(value="candidate/{id}/delete")
	public String deleteCandidate(HttpSession session,
			Model model,
			@PathVariable('id') String id){
		def candidate = candidateRepo.findOne(id)
		userRepo.delete(candidate.user.id)
		candidateRepo.delete(candidate.id)
		return "redirect:/admin/candidates"
	}

	@RequestMapping(value="candidate/{id}/edit")
	public String editCandidate(HttpSession session,
								Model model,
								@PathVariable('id') String id){
		def candidate = candidateRepo.findOne(id)
		model.addAttribute('candidate', candidate)
		model.addAttribute("qualifications", qualificationRepo.findAll())
		model.addAttribute("fieldOfStudies", fieldRepo.findAll())
		model.addAttribute("specializations", specializationRepo.findAll())
		model.addAttribute("skills", skillRepo.findAll())
		model.addAttribute("countries", countryRepo.findAll())
		session.setAttribute("principal", getPrincipalAdmin());
		return "admin/edit-candidate"
	}
									
	// TODO add validation
	@RequestMapping(value="candidate/{id}/edit/savePersonalInformation", method=RequestMethod.POST)
	public String savePersonalInformation(Model model,
			@PathVariable('id') String id,
			@RequestParam(name="firstName", required=false) String firstName,
			@RequestParam(name="lastName", required=false) String lastName,
			@RequestParam(name="birthdate", required=false) String birthdate,
			@RequestParam(name="state", required=false) String state,
			@RequestParam(name="contact", required=false) String contact) throws NoPrincipalUserFound{

		// TODO BUG
		// Website adds a comma(,)
		contact = contact.replace(",", "");

		def candidate = candidateRepo.findOne(id)
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
		candidateRepo.save(candidate);
		return "redirect:/admin/candidate/${id}/edit";
	}

	@RequestMapping(value="candidate/{id}/edit/saveProfessionalInformation", method=RequestMethod.POST)
	public String saveProfessionalInformation(Model model,
			@PathVariable('id') String id,
			@RequestParam(name="qualification", required=false) String qualification,
			@RequestParam(name="fieldOfStudy", required=false) String fieldOfStudy,
			@RequestParam(name="specialization", required=false) String specialization,
			@RequestParam(name="salary", required=false) String salary,
			@RequestParam(name="title", required=false) String title,
			@RequestParam(name="skills", required=false) String skills,
			HttpSession session){
		
		def candidate = candidateRepo.findOne(id)

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
		return "redirect:/admin/candidate/${id}/edit";
	}

	@RequestMapping(value="candidate/{id}/edit/adminControls", method=RequestMethod.POST)
	public String saveAdminControls(Model model,
			@PathVariable('id') String id,
			@RequestParam('enabled') String enabled){
		def candidate = candidateRepo.findOne(id)
		candidate.user.enabled = (enabled == 'true')
		userRepo.save(candidate.user)
		return "redirect:/admin/candidate/${id}/edit";
	}

	@RequestMapping(value="employers")
	public String employers(Model model){
		model.addAttribute('employers', employerRepo.findAll())
		return "admin/employers"
	}
	
	
	@RequestMapping(value="employer/{id}/delete")
	public String deleteEmployer(Model model,
		@PathVariable('id') String id){
		def employer = employerRepo.findOne(id)
		userRepo.delete(employer.user.id)
		employerRepo.delete(employer.id)
		return "redirect:/admin/employers"
	}
	
	@RequestMapping("countries")
	public String countries(Model model){
		model.addAttribute('countries', countryRepo.findAll())
		return "admin/countries"
	}
	
	@RequestMapping("country/{id}/delete")
	public String deleteCountry(Model model,
		@PathVariable('id') String id){
		countryRepo.delete(id)
	return "redirect:/admin/countries"
	}
		
	@RequestMapping("country/edit")
	public String editCountry(Model model,
		@RequestParam('id') String id,
		@RequestParam('name') String name){
		def country = countryRepo.findOne(id)
		country.name = name
		countryRepo.save(country)
		return "redirect:/admin/countries"
	}
		
	@RequestMapping("country/add")
	public String addCountry(Model model,
		@RequestParam('name') String name){
		def country = new Country(name: name)
		countryRepo.save(country)
		return "redirect:/admin/countries"
	}
		
	@RequestMapping("states")
	public String states(Model model){
		def states = stateRepo.findAll()
		def locations = []
		states.each{
			locations << new Location(state: it, country: countryRepo.findOne(it.countryId))
		}
		model.addAttribute('locations', locations)
		model.addAttribute('countries', countryRepo.findAll())
		return "admin/states"
	}
	
	@RequestMapping("state/{id}/delete")
	public String deleteState(Model model,
		@PathVariable('id') String id){
		stateRepo.delete(id)
		return "redirect:/admin/states"
	}
		
	@RequestMapping("state/edit")
	public String editState(Model model,
		@RequestParam('countryId') String countryId,
		@RequestParam('stateId') String stateId,
		@RequestParam('name') String name){
		def state = stateRepo.findOne(stateId)
		state.name = name
		state.countryId = countryId
		stateRepo.save(state)
		return "redirect:/admin/states"
	}
		
	@RequestMapping("state/add")
	public String addState(Model model,
		@RequestParam('name') String name,
		@RequestParam('countryId') String countryId){
		def state = new State(name: name, countryId: countryId)
		stateRepo.save(state)
		return "redirect:/admin/states"
	}
	
	@RequestMapping("fields")
	public String fields(Model model){
		model.addAttribute('fields', fieldRepo.findAll())
		return "admin/fields"
	}
	
	@RequestMapping("field/{id}/delete")
	public String deleteField(Model model,
		@PathVariable('id') String id){
		fieldRepo.delete(id)
	return "redirect:/admin/fields"
	}
		
	@RequestMapping("field/edit")
	public String editField(Model model,
		@RequestParam('id') String id,
		@RequestParam('name') String name){
		def field = fieldRepo.findOne(id)
		field.name = name
		fieldRepo.save(field)
		return "redirect:/admin/fields"
	}
		
	@RequestMapping("field/add")
	public String addField(Model model,
		@RequestParam('name') String name){
		def field = new FieldOfStudy(name: name)
		fieldRepo.save(field)
		return "redirect:/admin/fields"
	}
		
	@RequestMapping("industries")
	public String industries(Model model){
		model.addAttribute('industries', industryRepo.findAll())
		return "admin/industries"
	}
	
	@RequestMapping("industry/{id}/delete")
	public String deleteIndustry(Model model,
		@PathVariable('id') String id){
		industryRepo.delete(id)
		return "redirect:/admin/industries"
	}
		
	@RequestMapping("industry/edit")
	public String editIndustry(Model model,
		@RequestParam('id') String id,
		@RequestParam('name') String name){
		def industry = industryRepo.findOne(id)
		industry.name = name
		industryRepo.save(industry)
		return "redirect:/admin/industries"
	}
		
	@RequestMapping("industry/add")
	public String addIndustry(Model model,
		@RequestParam('name') String name){
		def industry = new Industry(name: name)
		industryRepo.save(industry)
		return "redirect:/admin/industries"
	}
		
	@RequestMapping("qualifications")
	public String qualifications(Model model){
		model.addAttribute('qualifications', qualificationRepo.findAll())
		return "admin/qualifications"
	}
	
	@RequestMapping("qualification/{id}/delete")
	public String deleteQualification(Model model,
		@PathVariable('id') String id){
		qualificationRepo.delete(id)
		return "redirect:/admin/qualifications"
	}
		
	@RequestMapping("qualification/edit")
	public String editQualification(Model model,
		@RequestParam('id') String id,
		@RequestParam('name') String name){
		def qualification = qualificationRepo.findOne(id)
		qualification.name = name
		qualificationRepo.save(qualification)
		return "redirect:/admin/qualifications"
	}
		
	@RequestMapping("qualification/add")
	public String addQualification(Model model,
		@RequestParam('name') String name){
		def qualification = new Qualification(name: name)
		qualificationRepo.save(qualification)
		return "redirect:/admin/qualifications"
	}
		
	@RequestMapping("skills")
	public String skills(Model model){
		model.addAttribute('skills', skillRepo.findAll())
		return "admin/skills"
	}
	
	@RequestMapping("skill/{id}/delete")
	public String deleteSkill(Model model,
		@PathVariable('id') String id){
		skillRepo.delete(id)
		return "redirect:/admin/skills"
	}
		
	@RequestMapping("skill/edit")
	public String editSkill(Model model,
		@RequestParam('id') String id,
		@RequestParam('name') String name){
		def skill = skillRepo.findOne(id)
		skill.name = name
		skillRepo.save(skill)
		return "redirect:/admin/skills"
	}
		
	@RequestMapping("skill/add")
	public String addSkill(Model model,
		@RequestParam('name') String name){
		def skill = new Skill(name: name)
		skillRepo.save(skill)
		return "redirect:/admin/skills"
	}
	
	@RequestMapping("specializations")
	public String specializations(Model model){
		model.addAttribute('specializations', specializationRepo.findAll())
		return "admin/specializations"
	}
	
	@RequestMapping("specialization/{id}/delete")
	public String deleteSpecialization(Model model,
		@PathVariable('id') String id){
		specializationRepo.delete(id)
		return "redirect:/admin/specializations"
	}
		
	@RequestMapping("specialization/edit")
	public String editSpecialization(Model model,
		@RequestParam('id') String id,
		@RequestParam('name') String name){
		def specialization = specializationRepo.findOne(id)
		specialization.name = name
		specializationRepo.save(specialization)
		return "redirect:/admin/specializations"
	}
		
	@RequestMapping("specialization/add")
	public String addSpecialization(Model model,
		@RequestParam('name') String name){
		def specialization = new Specialization(name: name)
		specializationRepo.save(specialization)
		return "redirect:/admin/specializations"
	}
	
	private Admin getPrincipalAdmin(){
		String principalUser = AuthenticationUtil.getPrincipal();
		def user = userRepo.findByUsername(principalUser)
		def admin = adminRepo.findByUser(user.id)
		return admin
	}
}