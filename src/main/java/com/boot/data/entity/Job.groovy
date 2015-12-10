package com.boot.data.entity

import groovy.transform.ToString

import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.DBRef

@ToString()
public class Job implements EntityObject {
	@Id
	String id
	String name
	Location location
	String description
	Date posted
	Date expiry
	@DBRef
	List<Skill> skills
	long salary
	@DBRef
	Specialization specialization
	@DBRef
	FieldOfStudy field
}
