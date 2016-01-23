package com.boot.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boot.data.entity.Job;
import com.boot.data.repository.JobRepo;


@Controller
@RequestMapping(value = "/")
public class HomeController {
	
	@Autowired
	JobRepo jobRepo;
	
	@RequestMapping(method = RequestMethod.GET)   
	public String home(HttpServletRequest arg0,Locale locale ,Model model){
		List<Job> jobs = null ;
		if(jobRepo.count() > 3){
			jobs = jobRepo.findAll(new Sort(Sort.Direction.ASC, "posted")).subList(0, 2);
		}else{
			jobs = jobRepo.findAll(new Sort(Sort.Direction.ASC, "posted"));
		}
		model.addAttribute("jobs", jobs);
		return "main";
	}
	
	@RequestMapping(value ="/404", method = RequestMethod.GET)
	public String my404(Locale locale ,Model model){
		return "404";
	}
	
	@RequestMapping(value="second-resume")
	public String firstResume(){
		return "resume/second-resume/main";
	}
}
