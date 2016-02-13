package com.boot.data.entity;

import groovy.transform.ToString
import javax.persistence.Id
import org.springframework.data.mongodb.core.mapping.DBRef
import com.boot.mongo.config.*


@ToString()
public class Candidate implements EntityObject{
	@Id
	String id
	String firstName
	String lastName
	String contactNo
	String title
	String address
	String residenceAddress
	Education highSchool
	Education college
	List<Experience> experiences = []
	@DBRef()
	User user
	Date birthdate
	Location location
	Location residenceLocation
	@DBRef
	Specialization specialization
	@DBRef
	Qualification qualification
	long expectedSalary
	@DBRef
	FieldOfStudy field
	@DBRef
	List<Skill> skills = []
	String resumeName
	def resumeParams
	boolean hasPicture
	String pictureId
	String about
	String objective
	String resumeId
	String realResumeName
	String studentNumber
	Date registrationDate
	boolean resumeIsViewable = false
	List<String> documents
	ArrayList<Document> legal = []
	double totalYear
	
	Candidate(){
		
	}
}