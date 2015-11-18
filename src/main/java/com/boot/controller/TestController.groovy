package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody

import com.boot.data.entity.Candidate
import com.boot.data.entity.Country
import com.boot.data.entity.FieldOfStudy
import com.boot.data.entity.Qualification
import com.boot.data.entity.Specialization
import com.boot.data.entity.State
import com.boot.data.entity.User
import com.boot.data.repository.GCandidateRepository
import com.boot.data.repository.GFieldOfStudyRepository
import com.boot.data.repository.GQualificationRepository
import com.boot.data.repository.GSpecializationRepository
import com.boot.data.repository.GUserRepository
import com.boot.data.repository.imp.CustomerRepository

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	CustomerRepository repo
	@Autowired
	GUserRepository gUserRepo
	@Autowired
	GCandidateRepository gCandidateRepository
	@Autowired
	GCountryRepository gCountryRepo
	@Autowired
	GStateRepository gStateRepo
	@Autowired
	GQualificationRepository gQualificationRepo
	@Autowired
	GFieldOfStudyRepository gFStudyRepo
	@Autowired
	GSpecializationRepository gSpecializationRepo
	
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String test(){
		StringBuilder sb = new StringBuilder();
		
		loadBasicUser()
		loadBasicFieldOfStudy()
		loadBasicQualification()
		loadBasicCountry()
		loadBasicSpecialization()
		
		return sb.toString();
	}
	
	public loadBasicUser(){
		gUserRepo.deleteAll()
		gCandidateRepository.deleteAll()
		def user = new User(username: 'ralen', password: 'ralen', role: 'ROLE_CANDIDATE',
			enabled: true, email: 'ralencc@yahoo.com')
		gUserRepo.save(user)
		def candidate = new Candidate(firstName: 'ralen', lastName: 'mandap',
			user: user)
		gCandidateRepository.save(candidate)
	}
	
	public loadBasicCountry(){
		gCountryRepo.deleteAll()
		gStateRepo.deleteAll()
		def countr1 = new Country(name: 'Philippines')
		gCountryRepo.save(countr1)
		
		def countr2 = new Country(name: 'USA')
		gCountryRepo.save(countr2)
		
		def state3 = new State(name: "Pampanga", countryId:countr1.id)
		def state4 = new State(name: 'Clark', countryId:countr1.id)
		gStateRepo.save(state3)
		gStateRepo.save(state4)
		
		def state1 = new State(name: "UsaClark", countryId:countr2.id)
		def state2 = new State(name: 'UsaPampanga', countryId:countr2.id)
		gStateRepo.save(state1)
		gStateRepo.save(state2)
		
		countr1.states = [state3, state4]
		countr2.states = [state1, state2]
		
		gCountryRepo.save(countr1)
		gCountryRepo.save(countr2)
		
	}
	
	public loadBasicQualification(){
		gQualificationRepo.deleteAll()
		def qual = new Qualification(name: 'High School')
		def qual2 = new Qualification(name: 'College')
		gQualificationRepo.save(qual)
		gQualificationRepo.save(qual2)
	}
	
	public loadBasicFieldOfStudy(){
		gFStudyRepo.deleteAll()
		def study1 = new FieldOfStudy(name: 'IT')
		def study2 = new FieldOfStudy(name: 'Networking')
		gFStudyRepo.save(study1)
		gFStudyRepo.save(study2)
	}
	
	public loadBasicSpecialization(){
		gSpecializationRepo.deleteAll()
		def sp = new Specialization(name: 'Programming')
		def sp1 = new Specialization(name: 'Networking')
		gSpecializationRepo.save(sp)
		gSpecializationRepo.save(sp1)
		
	}
}