package com.boot.data.entity;

import groovy.transform.ToString

import javax.persistence.Id

@ToString()
public class User implements EntityObject {
	@Id 
	String id;
	String username;
	String password;
	String role;
	boolean enabled;
	String email;
}
