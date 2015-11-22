package com.boot.data.repository
import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.Skill;;


interface SkillRepository extends MongoRepository<Skill, String> {

}
