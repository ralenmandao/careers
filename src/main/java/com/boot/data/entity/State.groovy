package com.boot.data.entity;

import groovy.transform.ToString


@ToString()
public class State implements EntityObject {
	Long stateId
	String state
	Long countryId
}
