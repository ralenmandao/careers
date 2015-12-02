package com.boot.data.repository.imp

import groovy.sql.Sql

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

import com.boot.data.entity.Country
import com.boot.data.repository.CountryRepo

@Repository
class CountryRepoImp implements CountryRepo{

	@Autowired
	Sql sql
	
	@Override
	public void add(Country t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Country get(Long pk) {
		sql.firstRow("SELECT * FROM country WHERE countryId=${pk}")
	}

	@Override
	public void addAll(List<Country> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Country> getAll() {
		sql.rows("""SELECT * FROM country""") as List<Country>
	}

	@Override
	public void update(Country t) {
		// TODO Auto-generated method stub
		
	}

}
