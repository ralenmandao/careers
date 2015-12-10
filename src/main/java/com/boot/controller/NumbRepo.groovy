package com.boot.controller

import org.springframework.data.mongodb.repository.MongoRepository;

interface NumbRepo extends MongoRepository<Numb, String>{
	//List<Numb> findBySpecialization(String specialization)
}
