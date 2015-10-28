package com.boot.data.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.Candidate;
import com.boot.data.repository.CandidateRepository;
import com.boot.data.service.CandidateService;

@Service
@Transactional
public class CandidateServiceImp implements CandidateService{

	@Autowired
	private CandidateRepository candidateRepository;

	@Override
	public void setupService() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Candidate insert(Candidate object) throws Exception {
		object.getUser().setEnabled(true);
		object.getUser().setRole("ROLE_CANDIDATE");
		candidateRepository.addCandidate(object);
		return object;
	}

	@Override
	public Candidate update(Candidate object) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Candidate object) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Candidate findById(Long id) {
		return candidateRepository.getCandidate(id);
	}

	@Override
	public Candidate findByEmail(String email) {
		return candidateRepository.getCandidate(email);
	}

	
}
