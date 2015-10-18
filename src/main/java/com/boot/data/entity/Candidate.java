package com.boot.data.entity;

import javax.validation.constraints.*;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.NotBlank;

import com.sun.xml.internal.ws.policy.spi.PolicyAssertionValidator.Fitness;

public class Candidate extends User{
	private long candidateId;
	private String firstName;
	private String lastName;
	
	public Candidate(){};
	
	public Candidate(long candidateId, String firstName, String lastName) {
		super();
		this.candidateId = candidateId;
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public long getCandidateId() {
		return candidateId;
	}

	public void setCandidateId(long candidateId) {
		this.candidateId = candidateId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	@Override
	public boolean equals(Object that){
		return EqualsBuilder.reflectionEquals(this, that, "candidateId","userId");
	}
	
	@Override
	public int hashCode(){
		return HashCodeBuilder.reflectionHashCode(this, "candidateId");
	}
	
	@Override
	public String toString(){
		return super.toString() + "\n" + new ToStringBuilder(this)
					.append("candidateId", candidateId)
					.append("firstName", firstName)
					.append("lastName", lastName)
					.build();
	}
}
