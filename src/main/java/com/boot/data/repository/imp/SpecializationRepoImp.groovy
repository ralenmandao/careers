package com.boot.data.repository.imp

import groovy.sql.Sql

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

import com.boot.data.entity.Specialization
import com.boot.data.repository.SpecializationRepo

@Repository
class SpecializationRepoImp implements SpecializationRepo{

	@Autowired
	Sql sql
	
	@Override
	public void add(Specialization t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Specialization get(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<Specialization> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Specialization> getAll() {
		sql.rows("SELECT * FROM specialization")
	}

	@Override
	public void update(Specialization t) {
		// TODO Auto-generated method stub
		
	}

}
