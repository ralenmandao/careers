package com.boot.data.repository

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.rest.core.annotation.RepositoryRestResource

import com.boot.data.entity.User;

@RepositoryRestResource(collectionResourceRel = "user", path = "user")
interface GUserRepository extends MongoRepository<User, String>{
	User findByUsername(String username)
}
 