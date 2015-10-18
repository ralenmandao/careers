package com.boot.data.service;

import com.boot.data.entity.Candidate;

public interface CandidateService extends BaseService<Candidate, Long>{
	public Candidate findByUserId(Long userId);
	public Candidate findByEmail(String email);
}
