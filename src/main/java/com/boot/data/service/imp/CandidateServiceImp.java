package com.boot.data.service.imp;

import java.util.List;

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
	public Candidate findById(Long id) {
		return candidateRepository.getCandidate(id);
	}

	@Override
	public Candidate findByEmail(String email) {
		return candidateRepository.getCandidate(email);
	}

	@Override
	public void add(Candidate t) {
		t.getUser().setEnabled(true);
		t.getUser().setRole("ROLE_CANDIDATE");
		candidateRepository.addCandidate(t);
	}

	@Override
	public Candidate get(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<Candidate> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Candidate> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Candidate t) {
		// TODO Auto-generated method stub
		
	}

	
}
