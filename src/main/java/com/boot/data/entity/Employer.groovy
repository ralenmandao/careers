package com.boot.data.entity;

import groovy.transform.ToString

import javax.persistence.Id

import org.springframework.data.mongodb.core.mapping.DBRef

@ToString
public class Employer implements EntityObject{
	@Id
	String id
	String companyName
	@DBRef
	User user
}