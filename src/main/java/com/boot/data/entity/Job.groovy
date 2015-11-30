package com.boot.data.entity

import groovy.transform.ToString

import javax.persistence.Id;

@ToString
class Job {
	@Id
	String id
	String title
	Location location
	String description
	List<Skill> skills
	Date posted
}
