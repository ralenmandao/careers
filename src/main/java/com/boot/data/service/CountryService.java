package com.boot.data.service;

import java.util.List;

import com.boot.data.entity.Country;
import com.boot.exception.repository.RecordNotFound;

public interface CountryService extends BaseService<Country, Long>{
	public List<Country> findAll();
	public List<String> findAllStates(Long id) throws RecordNotFound;
}
