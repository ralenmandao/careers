package com.boot.data.entity
import groovy.transform.ToString

import javax.persistence.Id

@ToString
class Skill implements EntityObject{
	@Id
	String id
	String name
}
