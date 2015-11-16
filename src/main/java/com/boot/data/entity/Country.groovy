package com.boot.data.entity;

import javax.persistence.Id;

import groovy.transform.ToString;

@ToString
public class Country{
	@Id
	private long countryId
	private String name
}
