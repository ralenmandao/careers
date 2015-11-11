package com.boot.data.service.imp;import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.Candidate;
import com.boot.data.entity.User;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.UserRepository;
import com.boot.data.repository.imp.CandidateRepositoryImp;
import com.boot.data.service.CandidateService;

@Service
@Transactional
public class CandidateServiceImp extends CandidateService {

	private final static Logger logger = LoggerFactory.getLogger(CandidateServiceImp.class);
	
	@Autowired
	@Qualifier("repCandidate")
	private CandidateRepositoryImp rep;
	
	@Autowired
	@Qualifier("repUser")
	private UserRepository<User, Long> userRep;

	@Override
	public AbstractDAO<Candidate, Long> getRepository() {
		return rep;
	}

	@Override
	public Candidate getByUsername(String user) {
		return rep.getByUsername(user);
	}

}
