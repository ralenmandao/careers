package com.boot.data.repository.imp

import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.boot.data.entity.Job;

@RepositoryRestResource
interface GJobRepository extends MongoRepository<Job, String>{

}
