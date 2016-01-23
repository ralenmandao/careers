package com.boot.data.entity

import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.DBRef

import groovy.transform.ToString;

@ToString
class UserLoginFailure {
	@Id
	String id
	Date date
	String ip
	int attempt
}
