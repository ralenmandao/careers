package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.mongodb.repository.Query

import com.boot.data.entity.Job
import com.boot.data.entity.Specialization

interface JobRepo extends MongoRepository<Job, String>{
	List<Job> findByNameLikeIgnoreCaseOrDescriptionLikeIgnoreCase(String name, String desc)
	List<Job> findByNameContaining(String name)
}
