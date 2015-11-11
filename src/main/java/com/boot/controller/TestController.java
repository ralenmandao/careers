package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.data.entity.Employer;
import com.boot.data.repository.imp.EmployerRepositoryImp;
import com.boot.data.repository.imp.SampleRepository;
import com.boot.data.service.EmployeeService;
import com.boot.data.service.SampleService;
import com.boot.data.service.imp.EmployerServiceImp;

@Controller
@RequestMapping("/test")
@Transactional
public class TestController {
	
	@Autowired
	@Qualifier("serEmployer")
	private EmployerServiceImp serEmployer;
	@Autowired
	@Qualifier("serEmployee")
	private EmployeeService serEmployee;
	@Autowired
	@Qualifier("repEmployer")
	private EmployerRepositoryImp repEmployer;
	@Autowired
	private SampleService sampleService;
	@Autowired
	private SampleRepository sampleRepository;
	
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String test(){
		StringBuilder sb = new StringBuilder();
		Employer emp = new Employer();
		emp.setEmployerId(1);
		emp.setName("ralen");
		sampleRepository.save(emp);
		sampleRepository.delete(1L);
		sb.append(sampleService.getAll());
		
		return sb.toString();
	}
}