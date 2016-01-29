package com.boot.data.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.boot.data.entity.CandidateApplication;

public interface CandidateApplicationRepo extends MongoRepository<CandidateApplication, String>{
	CandidateApplication findByJobIdAndCandidateId(String jobId, String candidateId);
	List<CandidateApplication> findByCandidateId(String id);
	List<CandidateApplication> findByJobId(String jobId);
	List<CandidateApplication> findByEmployerId(String jobId);
	List<CandidateApplication> findByEmployerIdAndCandidateId(String awe, String lol);
	List<CandidateApplication> findByResult(String result);
	List<CandidateApplication> findByCandidateIdAndResult(String id,String result);
	List<CandidateApplication> findByEmployerIdAndResult(String id,String result);
}
