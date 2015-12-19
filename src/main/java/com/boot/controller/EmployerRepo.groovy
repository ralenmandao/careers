package com.boot.controller

import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.Employer

interface EmployerRepo extends MongoRepository<Employer, String>{
	Employer findByUserId(String id)
}
