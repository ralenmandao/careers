package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.Specialization

interface SpecializationRepo extends MongoRepository<Specialization, String>{
	Specialization findByName(String name)
}
