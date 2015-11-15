package com.boot.data.entity;

import groovy.transform.ToString

import javax.persistence.Id

@ToString()
public class User implements EntityObject {
	@Id 
	private String id;
	private String username;
	private String password;
	private String role;
	boolean enabled;
	String email;
}
