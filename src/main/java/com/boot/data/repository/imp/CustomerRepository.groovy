package com.boot.data.repository.imp

import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.data.repository.query.Param
import org.springframework.data.rest.core.annotation.RepositoryRestResource
import org.springframework.stereotype.Repository

import com.boot.data.entity.Customer

@Repository
@RepositoryRestResource(collectionResourceRel = "customer", path="people")
interface CustomerRepository extends MongoRepository<Customer, String>{
	Customer findByFirstName(@Param("firstName") String firstName)
	List<Customer> findByLastName(String lastName)
}
	