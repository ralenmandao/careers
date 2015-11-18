package com.boot.data.repository
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.boot.data.entity.FieldOfStudy;;

@RepositoryRestResource(collectionResourceRel = "fstudy", path="fstudy")
interface GFieldOfStudyRepository extends MongoRepository<FieldOfStudy, String>{
}
