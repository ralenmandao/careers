package com.boot.data.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.boot.data.entity.Country;
import com.boot.data.repository.CountryRepository;
import com.boot.data.service.CountryService;

@Component
public class CountryServiceImp implements CountryService{

	@Autowired
	private CountryRepository countryRepository;
	
	@Override
	public void setupService() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Country insert(Country object) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Country update(Country object) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Country object) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Country findById(Long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Country> findAll() {
		return (List<Country>) countryRepository.findAll();
	}

}
