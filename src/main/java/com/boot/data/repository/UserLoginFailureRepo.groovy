package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.UserLoginFailure

interface UserLoginFailureRepo extends MongoRepository<UserLoginFailure, String>{
	UserLoginFailure findByIp(String ip)
}
