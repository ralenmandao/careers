package com.boot.data.entity

import groovy.transform.ToString

import javax.persistence.Id

@ToString
class Customer {
	@Id
	private String id
	private String firstName
	private String lastName
}
