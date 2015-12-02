package com.boot.data.service.imp

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

import com.boot.data.entity.Country
import com.boot.data.repository.CountryRepo
import com.boot.data.repository.StateRepo;
import com.boot.data.service.CountryService
@Service
class CountryServiceImp implements CountryService{

	@Autowired
	CountryRepo countryRepo
	@Autowired
	StateRepo stateRepo
	
	@Override
	public void add(Country t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Country get(Long pk) {
		countryRepo.get(pk)
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
		countryRepo.getAll().each{
			it.states = stateRepo.getAllByCountryId(it.countryId)
		}
	}

	@Override
	public void update(Country t) {
		// TODO Auto-generated method stub
		
	}

}
