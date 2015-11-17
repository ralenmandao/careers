package com.boot.controller

import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.repository.query.Param
import org.springframework.data.rest.core.annotation.RepositoryRestResource

import com.boot.data.entity.State

@RepositoryRestResource
interface GStateRepository extends MongoRepository<State, String>{
	List<State> findByCountryId(@Param('id') String id)
}