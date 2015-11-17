package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody

import com.boot.data.entity.Candidate
import com.boot.data.entity.Country
import com.boot.data.entity.GCandidateRepository
import com.boot.data.entity.GUserRepository
import com.boot.data.entity.Qualification
import com.boot.data.entity.State
import com.boot.data.entity.User
import com.boot.data.repository.GQualificationRepository
import com.boot.data.repository.imp.CustomerRepository

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	private CustomerRepository repo;
	@Autowired
	private GUserRepository gUserRepo;
	@Autowired
	private GCandidateRepository gCandidateRepository;
	@Autowired
	private GCountryRepository gCountryRepo;
	@Autowired
	private GStateRepository gStateRepo;
	@Autowired
	private GQualificationRepository gQualificationRepo;
	
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String test(){
		StringBuilder sb = new StringBuilder();
		
		gQualificationRepo.deleteAll()
		loadBasicQualification()
		
		return sb.toString();
	}
	
	public loadBasicUser(){
		gUserRepo.deleteAll()
		gCandidateRepository.deleteAll()
		def user = new User(username: 'ralen', password: 'ralen', role: 'ROLE_CANDIDATE',
			enabled: true, email: 'ralencc@yahoo.com')
		def candidate = new Candidate(firstName: 'ralen', lastName: 'mandap',
			user: user)
	}
	
	public loadBasicCountry(){
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
		def qual = new Qualification(name: 'High School')
		def qual2 = new Qualification(name: 'College')
		gQualificationRepo.save(qual)
		gQualificationRepo.save(qual2)
	}
}