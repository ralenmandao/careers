package com.boot.data.repository

import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.repository.query.Param

import com.boot.data.entity.Job

interface JobRepo extends MongoRepository<Job, String>{
	List<Job> findByNameLikeIgnoreCaseOrDescriptionLikeIgnoreCaseOrLocationStateNameLikeIgnoreCaseOrLocationCountryNameLikeIgnoreCase(String name, String desc, String state, String coutry)
//	List<Job> findByEmployerId(String id);
	List<Job> findByEmployerId(@Param('id') String id);
	List<Job> findByType(String type)
}
