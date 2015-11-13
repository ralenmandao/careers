package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.data.repository.imp.GroovyRepository;

@Controller
@RequestMapping("/test")
@Transactional
public class TestController {
	
//	@Autowired
//	@Qualifier("serEmployer")
//	private EmployerServiceImp serEmployer;
//	@Autowired
//	@Qualifier("serEmployee")
//	private EmployeeService serEmployee;
//	@Autowired
//	@Qualifier("repEmployer")
//	private EmployerRepositoryImp repEmployer;
//	@Autowired
//	private SampleService sampleService;
//	@Autowired
//	private SampleRepository sampleRepository;
	@Autowired
	private GroovyRepository groovyRepository;
	
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String test(){
		StringBuilder sb = new StringBuilder();
		sb.append(groovyRepository.getAllEmployer().size());
		return sb.toString();
	}
}