package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.Industry

interface IndustryRepo extends MongoRepository<Industry, String>{
	Industry findByName(String name)
}
