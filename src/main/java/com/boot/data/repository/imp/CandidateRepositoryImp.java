package com.boot.data.repository.imp;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.boot.data.entity.Candidate;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.CandidateRepository;

@Repository("repCandidate")
public class CandidateRepositoryImp extends CandidateRepository{
	@Override
	public String getIdColumnName() {
		return "candidateId";
	}

	@Override
	protected String getTableName() {
		return "candidate";
	}

	@Override
	public Candidate getByUsername(String user) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("username", user));
		return (Candidate) crit.uniqueResult();
	}
	
}
