package com.boot.data.repository.imp;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.boot.data.entity.Country;
import com.boot.data.entity.EntityObject;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.CountryRepository;

@Repository("repCountry")
public class CountryRepositoryImp extends CountryRepository<Country, Long>{
	
	@Override
	protected String getTableName() {
		return "country";
	}

	@Override
	protected String getIdColumnName() {
		return "countryId";
	}
	
}
