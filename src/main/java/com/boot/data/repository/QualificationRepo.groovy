package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.Qualification

interface QualificationRepo extends MongoRepository<Qualification, String>{

}
