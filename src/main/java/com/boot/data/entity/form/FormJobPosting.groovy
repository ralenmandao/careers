package com.boot.data.entity.form

import groovy.transform.ToString

import com.boot.data.entity.Skill

@ToString
class FormJobPosting {
	String title
	long salaryFrom
	long salaryTo
	List<Skill> skills
	String description
}
