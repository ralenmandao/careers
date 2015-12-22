package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.Admin

interface AdminRepo extends MongoRepository<Admin, String>{
	Admin findByUser(String id)
}
