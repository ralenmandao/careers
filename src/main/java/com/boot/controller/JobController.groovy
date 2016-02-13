package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

import com.boot.data.entity.Candidate
import com.boot.data.entity.CandidateApplication
import com.boot.data.repository.CandidateApplicationRepo
import com.boot.data.repository.CandidateRepo
import com.boot.data.repository.CountryRepo
import com.boot.data.repository.FieldRepo
import com.boot.data.repository.JobRepo
import com.boot.data.repository.QualificationRepo
import com.boot.data.repository.SkillRepo
import com.boot.data.repository.SpecializationRepo
import com.boot.data.repository.StateRepo
import com.boot.data.repository.UserRepo
import com.boot.helper.AuthenticationUtil

@Controller
public class JobController {
	
	@Autowired UserRepo userRepo
	@Autowired CandidateRepo candidateRepo
	@Autowired QualificationRepo qualificationRepo
	@Autowired FieldRepo fieldRepo
	@Autowired SpecializationRepo specializationRepo
	@Autowired SkillRepo skillRepo
	@Autowired CountryRepo countryRepo
	@Autowired StateRepo stateRepo
	@Autowired JobRepo jobRepo
	@Autowired CandidateApplicationRepo candidateApplicationRepo
	
	@RequestMapping(value="/job/{jobId}", method=RequestMethod.GET)
	public String register(Model model,
						   @PathVariable("jobId") String jobId){
		def job = jobRepo.findOne(jobId)
		def candidate = getPrincipalCandidate()
		if(job){
			model.addAttribute("job",job)
		}else{
			return "404"
		}
		def app = candidateApplicationRepo.findByJobIdAndCandidateId(jobId, candidate.id);
		model.addAttribute('principal',candidate)
		model.addAttribute('applied', app != null)
		return "job/job-display";
	}
						   
   @RequestMapping(value="/job/{jobId}/apply", method=RequestMethod.POST)
   public String apply(Model model,
						  @PathVariable("jobId") String jobId,
						  @RequestParam("cover") String cover){
		
	   def job = jobRepo.findOne(jobId)
	   def candidate = getPrincipalCandidate()
	   if(job){
		   if(!candidateApplicationRepo.findByJobIdAndCandidateId(job.id, candidate.id)){
			   candidateApplicationRepo.save(new CandidateApplication(job: job, candidate: candidate,cover: cover, employer: job.employer, applied: new Date()))
			   return "redirect:/candidate/jobApplication?applied"
		   }else{
			   println "Multiple appliying on the same job"
		   }
	   }else{
		   return "404"
	   }
	   return "job/job-display";
   }
						  
  private Candidate getPrincipalCandidate(){
	  String principalUser = AuthenticationUtil.getPrincipal();
	  def user = userRepo.findByUsername(principalUser)
	  def candidate = candidateRepo.findByUserId(user.id)
	  return candidate
  }
}
