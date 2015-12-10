package com.boot.data.entity;

import groovy.transform.ToString

import javax.persistence.Id
import org.springframework.data.mongodb.core.mapping.DBRef;
import com.boot.mongo.config.*;

@ToString
public class Country implements EntityObject{
	@Id
	String id
	String name
	@DBRef
	List<State> states
}
