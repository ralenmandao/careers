package com.boot.data.repository.imp

import groovy.sql.Sql

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

import com.boot.data.entity.Skill
import com.boot.data.repository.SkillRepo

@Repository
class SkillRepoImp implements SkillRepo{
	
	@Autowired
	Sql sql
	
	@Override
	public void add(Skill t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Skill get(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<Skill> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Skill> getAll() {
		sql.rows("SELECT * FROM skill")
	}

	@Override
	public void update(Skill t) {
		// TODO Auto-generated method stub
		
	}

}
