package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.data.entity.Employee;
import com.boot.data.entity.Employer;
import com.boot.data.service.EmployeeService;
import com.boot.data.service.EmployerService;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	@Qualifier("serEmployer")
	private EmployerService serEmployer;
	@Autowired
	@Qualifier("serEmployee")
	private EmployeeService serEmployee;
	
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String test(){
		StringBuilder sb = new StringBuilder();
		
		Employer employer = new Employer();
		employer.setName("Ralen");
		
		serEmployer.add(employer);
		
		Employee employee = new Employee();
		employee.setName("Judith");
		employee.setEmployer(employer);
		serEmployee.add(employee);
		
		serEmployer.remove(employer.getEmployerId());
		
		Employee temp = serEmployee.get(employee.getEmployeeId());
		
		sb.append(temp);
		
		return sb.toString();
	}
}