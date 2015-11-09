package com.boot.data.repository.imp;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.boot.data.entity.Candidate;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.CandidateRepository;

@Repository
public class CandidateRepositoryImp extends CandidateRepository{
	@Override
	public String getIdColumnName() {
		return "candidateId";
	}

	@Override
	protected String getTableName() {
		return "candidate";
	}
	
}
