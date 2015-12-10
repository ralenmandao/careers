package com.boot.data.entity

import groovy.transform.ToString

import org.springframework.data.annotation.Id

@ToString
class Qualification implements EntityObject{
	@Id
	String id
	String name
}
