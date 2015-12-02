package com.boot.data.repository

import com.boot.data.entity.Candidate

interface CandidateRepo extends BaseRepository<Candidate, Long>{
	public Candidate findByUserId(Long id);
}
