package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.Skill

interface SkillRepo extends MongoRepository<Skill, String>{
	Skill findByName(String name);
}
