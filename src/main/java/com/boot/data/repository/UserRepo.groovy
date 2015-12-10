package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.User

interface UserRepo extends MongoRepository<User, String>{
	User findByUsername(String username)
	User findByEmail(String email)
}
