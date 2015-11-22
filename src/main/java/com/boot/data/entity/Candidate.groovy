package com.boot.data.entity;

import groovy.transform.ToString
import javax.persistence.Id
import org.springframework.data.mongodb.core.mapping.DBRef
import com.boot.mongo.config.*;


@ToString()
public class Candidate implements EntityObject{
	@Id
	String id
	String firstName
	String lastName
	String contactNo
	String title
//	@DBRef
//	@CascadeSave
	User user
	Date birthdate
	Location location
	@DBRef
	Specialization specialization
	@DBRef
	Qualification qualification
	long expectedSalary
	@DBRef
	FieldOfStudy fieldOfStudy
	

//	public String getFirstName(){
//		def sString = firstName.toLowerCase();
//		sString = Character.toString(sString.charAt(0)).toUpperCase()+sString.substring(1);
//		return sString
//	}
//	
//	public String getLastName(){
//		def sString = lastName.toLowerCase();
//		sString = Character.toString(sString.charAt(0)).toUpperCase()+sString.substring(1);
//		return sString
//	}
}