package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody

import com.boot.data.entity.Candidate
import com.boot.data.entity.GCandidateRepository
import com.boot.data.entity.GUserRepository
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
		
		Candidate candidate = new Candidate(firstName: 'ralen',
			lastName: 'mandap', user: gUserRepo.findByUsername('candidate'))
		gCandidateRepository.save candidate

		return sb.toString();
	}
}