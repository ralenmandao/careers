package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.repository.query.Param

import com.boot.data.entity.Country

interface CountryRepo extends MongoRepository<Country, String>{
	Country findByName(String name)
	Long deleteCountryById(String id)
}
