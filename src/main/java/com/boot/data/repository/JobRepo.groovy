package com.boot.data.repository

import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.Job

interface JobRepo extends MongoRepository<Job, String>{
	List<Job> findByNameLikeIgnoreCaseOrDescriptionLikeIgnoreCase(String name, String desc)
	List<Job> findByEmployerId(String id);
	Page<?> findByEmployerId(String id, Pageable page);
}
