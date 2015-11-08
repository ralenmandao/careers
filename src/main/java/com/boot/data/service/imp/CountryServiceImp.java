package com.boot.data.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.Country;
import com.boot.data.repository.CountryRepository;
import com.boot.data.service.CountryService;

@Service
@Transactional
public class CountryServiceImp implements CountryService{

	@Autowired
	@Qualifier("repCountry")
	private CountryRepository repCountry;

	@Override
	public void add(Country t) {
		
	}

	@Override
	public Country get(Long id) {
		return repCountry.get(id);
	}

	@Override
	public void addAll(List<Country> lst) {
		//lst.forEach(e ->  );
	}

	@Override
	public void remove(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Country> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Country t) {
		// TODO Auto-generated method stub
		
	}

	
}
