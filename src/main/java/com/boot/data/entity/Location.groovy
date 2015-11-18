package com.boot.data.entity;

import javax.persistence.Id

import org.springframework.data.mongodb.core.mapping.DBRef


public class Location {
	@Id
	String id;
	@DBRef
 	Country country;
	 @DBRef
	State state;
}
