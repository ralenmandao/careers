package com.boot.data.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

@Entity
@Table(name="candidate")
public class Candidate implements EntityObject{
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private long candidateId;
	
	@Column(name="firstName", nullable=false, length=45)
	private String firstName;
	
	@Column(name="lastName", nullable=false, length=45)
	private String lastName;
	
	@OneToOne
	@JoinColumn(name="userId")
	private User user;
	
	@Column(name="birthdate")
	private Date birthdate;
	
	@OneToOne
	@JoinColumn(name="locationId")
	private Location location;
	
	
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
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
		return user.toString() + "\n" + new ToStringBuilder(this)
					.append("candidateId", candidateId)
					.append("firstName", firstName)
					.append("lastName", lastName)
					.build();
	}
}
