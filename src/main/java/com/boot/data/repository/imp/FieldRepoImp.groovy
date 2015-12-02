package com.boot.data.repository.imp

import groovy.sql.Sql

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

import com.boot.data.entity.FieldOfStudy
import com.boot.data.repository.FieldRepo

@Repository
class FieldRepoImp implements FieldRepo{

	@Autowired
	Sql sql
	
	@Override
	public void add(FieldOfStudy t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FieldOfStudy get(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<FieldOfStudy> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<FieldOfStudy> getAll() {
		sql.rows("SELECT * FROM field")
	}

	@Override
	public void update(FieldOfStudy t) {
		// TODO Auto-generated method stub
		
	}

}
