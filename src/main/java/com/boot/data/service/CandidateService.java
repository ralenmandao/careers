package com.boot.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.boot.data.entity.Candidate;
import com.boot.data.repository.AbstractDAO;

public abstract class CandidateService extends AbstractService<Candidate, Long>{


		
	public abstract Candidate getByUsername(String email);
	
}
