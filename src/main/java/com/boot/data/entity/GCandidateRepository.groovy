package com.boot.data.entity

import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.rest.core.annotation.RepositoryRestResource

@RepositoryRestResource(collectionResourceRel="candidates", path="candidates")
interface GCandidateRepository extends MongoRepository<Candidate, String>{
	
}
