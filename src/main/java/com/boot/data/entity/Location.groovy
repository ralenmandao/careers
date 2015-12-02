package com.boot.data.entity;

import groovy.transform.ToString

@ToString
public class Location implements EntityObject{
	Long locationId;
 	Country country;
	State state;
}
