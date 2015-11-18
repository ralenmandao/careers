package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.repository.query.Param
import org.springframework.data.rest.core.annotation.RepositoryRestResource

import com.boot.data.entity.Candidate;

@RepositoryRestResource(collectionResourceRel="candidates", path="candidates")
interface GCandidateRepository extends MongoRepository<Candidate, String>{
	Candidate findByUserUsername(@Param('username')String username)
}
