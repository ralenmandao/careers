package com.boot.data.entity

import groovy.transform.ToString

import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.DBRef

@ToString
class Admin {
	@Id
	String id
	String firstName
	String lastName
	@DBRef
	User user
}
