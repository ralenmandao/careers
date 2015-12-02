package com.boot.data.service.imp

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

import com.boot.data.entity.Candidate
import com.boot.data.repository.CandidateRepo
import com.boot.data.repository.LocationRepo
import com.boot.data.repository.UserRepo
import com.boot.data.service.CandidateService

@Service
class CandidateServiceImp implements CandidateService{

	Logger logger = LoggerFactory.getLogger(CandidateServiceImp.class)
	
	@Autowired
	CandidateRepo candidateRepo
	@Autowired
	UserRepo userRepo
	@Autowired
	LocationRepo locationRepo
	
	@Override
	public void add(Candidate t) {
		t.user.username = t.user.email
		t.user.enabled = true
		t.user.role = 'ROLE_CANDIDATE'
		userRepo.add(t.user)
		candidateRepo.add(t)
	}

	@Override
	public Candidate get(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<Candidate> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Candidate> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Candidate t) {
		candidateRepo.update(t)
	}

	@Override
	public Candidate findByUserUsername(String username) {
		def user = userRepo.findByUsername(username)
		if(!user) return null
		def candidate = candidateRepo.findByUserId(user.userId)
		candidate.location = locationRepo.get(candidate.location.locationId)
		return candidate
	}

}
