package com.boot.data.entity

import javax.persistence.Id

import groovy.transform.ToString;

@ToString
class Customer {
	@Id
	private String id
	private String firstName
	private String lastName
}
