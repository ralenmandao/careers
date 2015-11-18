package com.boot.data.repository

import com.boot.data.entity.Specialization
import org.springframework.data.mongodb.repository.MongoRepository;

interface GSpecializationRepository extends MongoRepository<Specialization, String>{

}
