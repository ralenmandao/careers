package com.boot.data.entity

import groovy.transform.ToString

import org.springframework.data.annotation.Id

@ToString
public class Specialization implements EntityObject{
	@Id
	String id
	String name
}
