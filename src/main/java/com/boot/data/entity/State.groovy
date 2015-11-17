package com.boot.data.entity;

import javax.persistence.Id;

import groovy.transform.ToString;


@ToString()
public class State {
	@Id
	String id
	String name
	String countryId
}
