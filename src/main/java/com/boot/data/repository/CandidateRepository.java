package com.boot.data.repository;

import com.boot.data.entity.Candidate;

public abstract class CandidateRepository extends AbstractDAO<Candidate, Long> {
	public abstract Candidate getByUsername(String user);
}