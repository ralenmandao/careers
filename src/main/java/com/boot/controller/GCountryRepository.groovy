package com.boot.controller

import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.rest.core.annotation.RepositoryRestResource

import com.boot.data.entity.Country

@RepositoryRestResource(collectionResourceRel = "countries", path = "countries")
interface GCountryRepository extends MongoRepository<Country, String>{
	public Country findByName(String name);
}
