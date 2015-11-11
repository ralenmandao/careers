package com.boot.data.repository.imp;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.boot.data.entity.Candidate;
import com.boot.data.repository.CandidateRepository;

@Repository("repCandidate")
public class CandidateRepositoryImp extends CandidateRepository<Candidate, Long>{
	
	private static final Logger logger = LoggerFactory.getLogger(CandidateRepositoryImp.class);
	
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
		//crit.add(Restrictions.eq("username", user)); 
		System.out.println(crit.list().size());
		return (Candidate) crit.uniqueResult();
	}
	
}
