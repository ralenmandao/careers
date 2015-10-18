package com.boot.data.entity;

import javax.validation.constraints.*;
import javax.persistence.*;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class User implements Entity{
	private String email;
	private String password;
	private long userId;
	private String type;
	private String status;
	
	public User(){}
	
	
	public User(String email, String password, long userId, String type,
			String status) {
		super();
		this.email = email;
		this.password = password;
		this.userId = userId;
		this.type = type;
		this.status = status;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public long getUserId() {
		return userId;
	}



	public void setUserId(long userId) {
		this.userId = userId;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public boolean equals(Object that){
		return EqualsBuilder.reflectionEquals(this, that, "userId", "email");
	}
	
	@Override
	public int hashCode(){
		return HashCodeBuilder.reflectionHashCode(this, "userId");
	}
	
	@Override
	public String toString(){
		return new ToStringBuilder(this, ToStringStyle.DEFAULT_STYLE).
				append("ID", userId).
				append("email", email).
				append("password", password).
				append("type", type).
				append("status", status).build();
	}
	
}
