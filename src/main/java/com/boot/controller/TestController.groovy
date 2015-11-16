package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody

import com.boot.data.entity.Candidate
import com.boot.data.entity.GCandidateRepository
import com.boot.data.entity.GUserRepository
import com.boot.data.entity.User
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
	
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String test(){
		StringBuilder sb = new StringBuilder();
		gUserRepo.deleteAll()
		gCandidateRepository.deleteAll()
		
		def user = new User(username: 'ralen', password: 'ralen', role: 'ROLE_CANDIDATE',
			enabled: true, email: 'ralencc@yahoo.com')
		def candidate = new Candidate(firstName: 'ralen', lastName: 'mandap',
			user: user)

		gCandidateRepository.save(candidate)

		return sb.toString();
	}
}