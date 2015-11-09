package com.boot.data.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.Country;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.CountryRepository;
import com.boot.data.service.CountryService;

@Service
@Transactional
public class CountryServiceImp extends CountryService{

	@Autowired
	@Qualifier("repCountry")
	private CountryRepository rep;
	
	@Override
	public AbstractDAO<Country, Long> getRepository() {
		return rep;
	}
}
