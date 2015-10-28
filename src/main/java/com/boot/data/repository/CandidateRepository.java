package com.boot.data.repository;

import com.boot.data.entity.Candidate;

public interface CandidateRepository {
	public Candidate getCandidate(Long id);
	public void addCandidate(Candidate c);
	public Candidate getCandidate(String email);
}
