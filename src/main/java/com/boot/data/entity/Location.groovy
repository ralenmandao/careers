package com.boot.data.entity;

import javax.persistence.Id

import org.springframework.data.mongodb.core.mapping.DBRef

import com.fasterxml.jackson.annotation.JsonAutoDetect

public class Location implements Serializable{
	Country country;
	State state;
}
