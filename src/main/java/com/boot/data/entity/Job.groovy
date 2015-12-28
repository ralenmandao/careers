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
	Employer employer
	@DBRef
	List<Skill> skills
	long salaryFrom
	long salaryTo
	@DBRef
	List<Candidate> applicants
}
