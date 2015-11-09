package com.boot.data.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.Candidate;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.CandidateRepository;
import com.boot.data.repository.UserRepository;
import com.boot.data.service.CandidateService;

@Service
@Transactional
public class CandidateServiceImp extends CandidateService {

	@Autowired
	@Qualifier("repCandidate")
	private CandidateRepository rep;
	
	@Autowired
	@Qualifier("repUser")
	private UserRepository userRep;

	@Override
	public AbstractDAO<Candidate, Long> getRepository() {
		return rep;
	}

	@Override
	public Candidate getByUsername(String user) {
		return rep.getByUsername(user);
	}

}
