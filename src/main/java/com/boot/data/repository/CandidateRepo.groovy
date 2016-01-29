package com.boot.data.repository

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.Candidate
import com.boot.data.entity.User;

interface CandidateRepo extends MongoRepository<Candidate, String>{
	Candidate findByUserId(String id);
	List<Candidate> findBySpecialization(String specialization)
	List<Candidate> findByFirstNameIgnoreCaseContainingOrLastNameIgnoreCaseContainingOrTitleIgnoreCaseContaining(String s, String d, String z)
}
