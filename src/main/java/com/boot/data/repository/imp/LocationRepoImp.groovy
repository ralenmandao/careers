package com.boot.data.repository.imp

import groovy.sql.Sql

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

import com.boot.data.entity.Location
import com.boot.data.repository.LocationRepo

@Repository
class LocationRepoImp implements LocationRepo{

	@Autowired
	Sql sql
	
	@Override
	public void add(Location t) {
		t.locationId = sql.executeInsert("INSERT INTO location values(?,?,?)",
			[null, t.country.countryId, t.state.stateId])[0][0]
	}

	@Override
	public Location get(Long pk) {
		sql.firstRow("SELECT * FROM location WHERE locationId=${pk}")
	}

	@Override
	public void addAll(List<Location> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Location> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Location t) {
		sql.executeUpdate("UPDATE location SET stateId=${t.state.stateId}, countryId=${t.country.countryId} WHERE locationId=${t.locationId}")
	}

}
