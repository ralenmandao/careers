package com.boot.data.entity;

import groovy.transform.ToString

import org.springframework.data.annotation.Id


@ToString()
public class State implements EntityObject {
	@Id
	String id
	String name
	String countryId
}
