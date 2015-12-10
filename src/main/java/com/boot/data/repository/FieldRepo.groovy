package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.FieldOfStudy

interface FieldRepo extends MongoRepository<FieldOfStudy, String>{
	FieldOfStudy findByName(String name)
}
