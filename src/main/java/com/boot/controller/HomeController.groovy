package com.boot.controller;

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

import com.boot.data.entity.Job
import com.boot.data.entity.User
import com.boot.data.repository.ArticleRepo
import com.boot.data.repository.CandidateRepo
import com.boot.data.repository.JobRepo
import com.boot.data.repository.UserRepo
import com.boot.helper.MailMail


@Controller
@RequestMapping(value = "/")
public class HomeController {

	@Autowired
	JobRepo jobRepo;
	@Autowired
	UserRepo userRepo;
	@Autowired
	MailMail mail;
	@Autowired
	ArticleRepo articleRepo
	@Autowired
	CandidateRepo candidateRepo
	@Autowired
	EmployerRepo employerRepo

	@RequestMapping(method = RequestMethod.GET)
	public String home(HttpServletRequest arg0,Locale locale ,Model model){
		List<Job> jobs = null ;
		if(jobRepo.findByExpired(false).size() > 3){
			jobs = jobRepo.findByExpired(false).toSorted{ a,b -> b.posted <=> a.posted }.subList(0,3)
		}else{
			jobs = jobRepo.findByExpired(false).toSorted{ a,b -> b.posted <=> a.posted }
		}
		model.addAttribute("jobs", jobs);
		model.addAttribute('candidateSize', candidateRepo.count())
		model.addAttribute('employerSize', employerRepo.count())
		model.addAttribute('jobSize', jobRepo.count())
		return "main";
	}

	@RequestMapping(value ="/404", method = RequestMethod.GET)
	public String my404(Locale locale ,Model model){
		return "404";
	}

	@RequestMapping(value="/forgot")
	public String forgotPassword(){
		return "forgotPassword";
	}

	@RequestMapping(value="/forgot", method = RequestMethod.POST)
	public String forgot(
			@RequestParam("email") String email
	){
		User user = userRepo.findByEmail(email);
		if(user == null)
			return "redirect:/forgot?invalidEmail";

		mail.sendMail("DHVTSU-CAREERS", user.getEmail(),"Password reset",
				"To reset your password go to this link http://localhost:8080/reset/" + user.getId());
		return "redirect:/forgot?success";
	}

	@RequestMapping(value="/reset/{id}", method = RequestMethod.GET)
	public String resetGET(
			@PathVariable("id") String id,
			Model model
	){
		User user = userRepo.findOne(id);
		if(user == null)
			return "404";
		model.addAttribute("user",user);
		return "resetPassword";
	}

	@RequestMapping(value="/reset/{id}", method = RequestMethod.POST)
	public String resetPOST(
			@PathVariable("id") String id,
			@RequestParam("password") String password
	){
		User user = userRepo.findOne(id);
		if(user == null)
			return "redirect:/forgot?invalidEmail";
		user.setPassword(password);
		userRepo.save(user);

		return "redirect:/login?changePassword";
	}

	@RequestMapping(value="/changeEmail/{id}")
	public String changeEmail(
			@PathVariable("id") String id,
			Model model
	){
		User user = userRepo.findOne(id);
		if(user == null)
			return "404";
		model.addAttribute("user", user);
		return "resetEmail";
	}

	@RequestMapping(value="/resetemail/{id}", method = RequestMethod.POST)
	public String resetEmailPOST(
			@PathVariable("id") String id,
			@RequestParam("email") String email,
			HttpSession session
	){
		User user = userRepo.findOne(id);
		if(userRepo.findByEmail(email) != null)
			return "redirect:/changeEmail/${id}?emailNotAvailable"
		if(user == null)
			return "404";
		user.setEmail(email);
		user.setUsername(email);
		userRepo.save(user);

		session.removeAttribute('principal')

		return "redirect:/login?changeEmailSuccessful";
	}

	@RequestMapping(value="/changePassword/{id}", method = RequestMethod.GET)
	public String resetPasswordGET(
			@PathVariable("id") String id,
			Model model
	){
		User user = userRepo.findOne(id);
		if(user == null)
			return "404";
		model.addAttribute("user",user);
		return "changePassword";
	}

	@RequestMapping(value="/changePassword/{id}", method = RequestMethod.POST)
	public String resetPasswordPOST(
			@PathVariable("id") String id,
			@RequestParam("password") String password,
			HttpSession session
	){
		User user = userRepo.findOne(id);
		if(user == null)
			return "redirect:/forgot?invalidEmail";
		user.setPassword(password);
		userRepo.save(user);
		
		session.removeAttribute('principal')

		return "redirect:/login?changePassword";
	}

	@RequestMapping(value="/news")
	public String news(Model model,
		@RequestParam('type') String type){
		model.addAttribute('type',type)
		model.addAttribute('articles', articleRepo.findAll());
		return "news"
	}
		
	@RequestMapping(value="terms")
	public String terms(){
		return "terms"
	}
	
	@RequestMapping(value="privacy")
	public String privacy(){
		return "privacy"
	}
	
	@RequestMapping(value="disclaimer")
	public String disclaimer(){
		return "disclaimer"
	}
	
	@RequestMapping(value="members")
	public String mained(){
		return "members"
	}
	
	@RequestMapping(value="second-resume")
	public String firstResume(){
		return "resume/second-resume/main";
	}
}
