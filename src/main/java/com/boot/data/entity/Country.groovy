package com.boot.data.entity;

import groovy.transform.ToString

import javax.persistence.Id

import com.fasterxml.jackson.annotation.JsonProperty

@ToString
public class Country{
	@Id
	@JsonProperty
	String id
	String name
	List<State> states
}
