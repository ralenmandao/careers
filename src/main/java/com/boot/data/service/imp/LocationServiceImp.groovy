package com.boot.data.service.imp

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

import com.boot.data.entity.Location
import com.boot.data.repository.LocationRepo
import com.boot.data.service.LocationService

@Service
class LocationServiceImp implements LocationService{

	@Autowired
	LocationRepo locationRepo
	
	@Override
	public void add(Location t) {
		locationRepo.add(t)
	}

	@Override
	public Location get(Long pk) {
		locationRepo.get(pk)
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
		// TODO Auto-generated method stub
		
	}

}
