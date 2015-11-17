package com.boot.data.entity;

import groovy.transform.ToString

import javax.persistence.Id

@ToString()
public class Candidate implements EntityObject{
	@Id
	String id
	String firstName
	String lastName
	String contactNo
	User user
	Date birthdate
	Location location
}