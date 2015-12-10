package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody

import com.boot.data.entity.Candidate
import com.boot.data.entity.Country
import com.boot.data.entity.FieldOfStudy
import com.boot.data.entity.Job
import com.boot.data.entity.Location
import com.boot.data.entity.Qualification
import com.boot.data.entity.Skill
import com.boot.data.entity.Specialization
import com.boot.data.entity.State
import com.boot.data.entity.User
import com.boot.data.repository.CandidateRepo
import com.boot.data.repository.CountryRepo
import com.boot.data.repository.FieldRepo
import com.boot.data.repository.JobRepo
import com.boot.data.repository.QualificationRepo
import com.boot.data.repository.SkillRepo
import com.boot.data.repository.SpecializationRepo
import com.boot.data.repository.StateRepo
import com.boot.data.repository.UserRepo

@Controller
@RequestMapping("/test")
public class TestController {
	//
	//	@Autowired
	//	CustomerRepository repo
	//	@Autowired
	//	userRepository userRepo
	//	@Autowired
	//	candidateRepo candidateRepo
	//	@Autowired
	//	countryRepository countryRepo
	//	@Autowired
	//	stateRepository stateRepo
	//	@Autowired
	//	qualificationRepository qualificationRepo
	//	@Autowired
	//	GFieldOfStudyRepository fieldRepo
	//	@Autowired
	//	specializationRepository specializationRepo
	//	@Autowired
	//	SkillRepository skillRepo
	//

	@Autowired UserRepo userRepo;
	@Autowired CandidateRepo candidateRepo;
	@Autowired CountryRepo countryRepo
	@Autowired StateRepo stateRepo
	@Autowired QualificationRepo qualificationRepo
	@Autowired FieldRepo fieldRepo
	@Autowired SpecializationRepo specializationRepo
	@Autowired SkillRepo skillRepo
	@Autowired JobRepo jobRepo
	@Autowired NumbRepo numbRepo

	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String test(){
		def lol = specializationRepo.findOne('566581ba21e352d21faa205c')
		numbRepo.insert(new Numb())
		return ""
	}

	public loadBasicUser(){
		userRepo.deleteAll()
		candidateRepo.deleteAll()
		def user = new User(username: 'ralen', password: 'ralen', role: 'ROLE_CANDIDATE', enabled: true, email: 'ralencc@yahoo.com')
		userRepo.save(user)
		def candidate = new Candidate(firstName: 'ralen', lastName: 'mandap', user: user)
		candidateRepo.save(candidate)
	}

	@RequestMapping(value="/reset", method=RequestMethod.GET)
	public String reset(){
		loadBasicCountry()
		loadBasicQualification()
		loadBasicFieldOfStudy()
		loadBasicSpecialization()
		loadBasicSkill()
		loadBasicJob()
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	@ResponseBody
	public String clear(){
		userRepo.deleteAll()
		candidateRepo.deleteAll()
		countryRepo.deleteAll()
		stateRepo.deleteAll()
		qualificationRepo.deleteAll()
		fieldRepo.deleteAll()
		specializationRepo.deleteAll()
		skillRepo.deleteAll()
		jobRepo.deleteAll()
		numbRepo.deleteAll()
		return ""
	}

	public loadBasicCountry(){
		countryRepo.deleteAll()
		stateRepo.deleteAll()
		def countr1 = new Country(name: 'Philippines')
		countryRepo.save(countr1)

		def countr2 = new Country(name: 'USA')
		countryRepo.save(countr2)

		def state3 = new State(name: "Pampanga", countryId:countr1.id)
		def state4 = new State(name: 'Clark', countryId:countr1.id)
		stateRepo.save(state3)
		stateRepo.save(state4)

		def state1 = new State(name: "UsaClark", countryId:countr2.id)
		def state2 = new State(name: 'UsaPampanga', countryId:countr2.id)
		stateRepo.save(state1)
		stateRepo.save(state2)

		countr1.states = [state3, state4]
		countr2.states = [state1, state2]

		countryRepo.save(countr1)
		countryRepo.save(countr2)

	}

	public loadBasicQualification(){
		qualificationRepo.deleteAll()
		def qual = new Qualification(name: 'High School')
		def qual2 = new Qualification(name: 'College')
		qualificationRepo.save(qual)
		qualificationRepo.save(qual2)
	}

	public loadBasicFieldOfStudy(){
		fieldRepo.deleteAll()
		def study1 = new FieldOfStudy(name: 'IT')
		def study2 = new FieldOfStudy(name: 'Networking')
		fieldRepo.save(study1)
		fieldRepo.save(study2)
	}

	public loadBasicSpecialization(){
		specializationRepo.deleteAll()
		def sp = new Specialization(name: 'Programming')
		def sp1 = new Specialization(name: 'Networking')
		specializationRepo.insert(sp)
		specializationRepo.insert(sp1)

	}

	public loadBasicSkill(){
		skillRepo.deleteAll()
		Skill skill = new Skill(name: 'C++')
		Skill skill2 = new Skill(name: 'Java')
		skillRepo.save(skill)
		skillRepo.save(skill2)
	}

	public loadBasicJob(){
		jobRepo.deleteAll()
		def job1 = new Job(name: 'Senior Java Programmer', 
			location: new Location(country: countryRepo.findByName('USA'), state: stateRepo.findByName('UsaClark')),
			description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum accusantium deleniti neque architecto vitae.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, ',
			posted: new Date(),
			expiry: new Date(),
			skills: [skillRepo.findByName('C++')],
			salary: 100000,
			specialization: specializationRepo.findByName('Programming'),
			field: fieldRepo.findByName('Networking'))
		
		def job2 = new Job(name: 'Java Programmer',
			location: new Location(country: countryRepo.findByName('USA'), state: stateRepo.findByName('UsaClark')),
			description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum accusantium deleniti neque architecto vitae.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, ',
			posted: new Date(),
			expiry: new Date(),
			skills: [skillRepo.findByName('Java')],
			salary: 100000,
			specialization: specializationRepo.findByName('Networking'),
			field: fieldRepo.findByName('Networking'))
		jobRepo.save(job1)
		jobRepo.save(job2)
	}
}