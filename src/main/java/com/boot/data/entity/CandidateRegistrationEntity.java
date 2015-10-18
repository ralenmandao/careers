package com.boot.data.entity;

public class CandidateRegistrationEntity extends Candidate{
	private String repassword;

	public CandidateRegistrationEntity(){
		super();
	};
	
	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	
	
}
