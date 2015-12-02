package com.boot.data.repository.imp

import groovy.sql.Sql

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

import com.boot.data.entity.State
import com.boot.data.repository.StateRepo

@Repository
class StateRepoImp implements StateRepo{

	@Autowired
	Sql sql
	
	def convertToState = { row ->
		new State(stateId: row.stateId, state: row.state, countryId: row.countryId)
	}
	
	@Override
	public void add(State t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public State get(Long pk) {
		def row = sql.firstRow("SELECT * FROM state WHERE stateId=${pk}")
		//convertToState row
	}

	@Override
	public void addAll(List<State> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<State> getAll() {
		sql.rows("SELECT * FROM state")
	}

	@Override
	public void update(State t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<State> getAllByCountryId(Long countryId) {
		sql.rows("SELECT * FROM state WHERE countryId=${countryId}")
	}

}
