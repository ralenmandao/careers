package com.boot.data.repository;

import com.boot.data.entity.Candidate;

public interface CandidateRepository {
	public Candidate findUserById(Long userId);
	public Candidate findUserByEmail(String email);
}
