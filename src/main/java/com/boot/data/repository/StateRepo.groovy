package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.repository.query.Param

import com.boot.data.entity.State

interface StateRepo extends MongoRepository<State, String>{
	State findByName(String name)
	List<State> findByCountryId(@Param("id") String id)
}
