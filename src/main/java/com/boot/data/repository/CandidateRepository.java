package com.boot.data.repository;

import com.boot.data.entity.Candidate;

public interface CandidateRepository extends BaseCrudRepository<Candidate, Long>{
	public Candidate findByUserId(Long userId);
	public Candidate findByEmail(String email);
}
