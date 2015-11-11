package com.boot.data.repository;

import java.io.Serializable;

import com.boot.data.entity.Candidate;
import com.boot.data.entity.EntityObject;

public abstract class CandidateRepository<T extends EntityObject, PK extends Serializable> extends AbstractDAO<Candidate, Long> {
	public abstract Candidate getByUsername(String user);
}