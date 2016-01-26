package com.boot.data.entity

import groovy.transform.ToString

import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.DBRef

@ToString
class CandidateApplication {
	@Id
	String id
	@DBRef
	Candidate candidate
	@DBRef
	Job job
	String cover
	int viewCount
	@DBRef
	Employer employer
	Date applied
	String result
	
	public void view(){
		viewCount = viewCount + 1
	}
}
