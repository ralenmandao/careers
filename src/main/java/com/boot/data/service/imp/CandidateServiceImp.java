package com.boot.data.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.data.entity.Candidate;
import com.boot.data.entity.User;
import com.boot.data.repository.CandidateRepository;
import com.boot.data.repository.UserRepository;
import com.boot.data.service.CandidateService;

@Service
public class CandidateServiceImp implements CandidateService{

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CandidateRepository candidateRepository;

	@Override
	public Candidate findByUserId(Long userId) {
		return null;
	}

	@Override
	public Candidate findByEmail(String email) {
		return null;
	}

	@Override
	public void setupService() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Candidate insert(Candidate object) throws Exception {
		// TODO Auto-generated method stub
		return null;
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
	public Candidate findById(Long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
