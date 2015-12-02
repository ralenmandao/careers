package com.boot.data.repository.imp

import groovy.sql.Sql

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

import com.boot.data.entity.Qualification
import com.boot.data.repository.QualificationRepo

@Repository
class QualificationRepoImp implements QualificationRepo{

	@Autowired
	Sql sql
	
	@Override
	public void add(Qualification t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Qualification get(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<Qualification> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Qualification> getAll() {
		sql.rows("SELECT * FROM qualification")
	}

	@Override
	public void update(Qualification t) {
		// TODO Auto-generated method stub
		
	}

}
