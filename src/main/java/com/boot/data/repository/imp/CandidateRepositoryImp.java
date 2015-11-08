package com.boot.data.repository.imp;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.boot.data.entity.Candidate;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.CandidateRepository;

@Repository
public class CandidateRepositoryImp extends AbstractDAO<Long, Candidate> implements CandidateRepository{

	@Override
	public Candidate getCandidate(Long id) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("candidateId", id));
		return (Candidate) crit.uniqueResult();
	}

	@Override
	public void addCandidate(Candidate c) {
		persist(c);
	}

	@Override
	public Candidate getCandidate(String email) {
		Criteria crit = createEntityCriteria().createAlias("user", "us");
		crit.add(Restrictions.eq("us.username", email));
		return (Candidate) crit.uniqueResult();
	}

	@Override
	public String getIdColumnName() {
		return "candidateId";
	}

	@Override
	protected String getTableName() {
		return "candidate";
	}
	
}
