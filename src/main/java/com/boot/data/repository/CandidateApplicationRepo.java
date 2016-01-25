package com.boot.data.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.boot.data.entity.CandidateApplication;

public interface CandidateApplicationRepo extends MongoRepository<CandidateApplication, String>{
	CandidateApplication findByJobIdAndCandidateId(String jobId, String candidateId);
	List<CandidateApplication> findByCandidateId(String id);
	List<CandidateApplication> findByJobId(String jobId);
}
