package com.boot.data.entity;

import groovy.transform.ToString
import javax.persistence.Id
import com.boot.mongo.config.*;


@ToString()
public class Candidate implements EntityObject{
	@Id
	Long candidateId
	String firstName
	String lastName
	String contactNo
	String title
	User user
	Date birthdate
	Location location
	Specialization specialization
	Qualification qualification
	long expectedSalary
	FieldOfStudy field
	List<Skill> skills = []
	String resumeName
	def resumeParams = [:]
}