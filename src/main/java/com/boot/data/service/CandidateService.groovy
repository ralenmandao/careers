package com.boot.data.service

import com.boot.data.entity.Candidate

interface CandidateService extends BaseService<Candidate, Long>{
	Candidate findByUserUsername(String username)
}
