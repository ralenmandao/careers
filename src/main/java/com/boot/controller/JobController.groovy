package com.boot.controller

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

import com.boot.data.entity.Candidate

@Controller
@RequestMapping("/job")
class JobController {
	@RequestMapping(value="one", method=RequestMethod.GET)
	public String editResume(Model model){
		return "job/blank"
	}
}
