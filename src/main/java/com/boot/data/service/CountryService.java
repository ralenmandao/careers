package com.boot.data.service;

import java.util.List;

import com.boot.data.entity.Country;

public interface CountryService extends BaseService<Country, Long>{
	public List<Country> findAll();
}
