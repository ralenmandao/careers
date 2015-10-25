package com.boot.data.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.boot.data.entity.Country;
import com.boot.data.repository.CountryRepository;
import com.boot.data.service.CountryService;
import com.boot.exception.repository.RecordNotFound;

@Component
public class CountryServiceImp implements CountryService{

	@Autowired
	private CountryRepository countryRepository;

	@Override
	public List<Country> findAll() {
		return null;
	}

	@Override
	public List<String> findAllStates(Long id) throws RecordNotFound {
		//return countryRepository.findAllStates(id);
		return null;
	}

}
