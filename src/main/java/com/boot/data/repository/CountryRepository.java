package com.boot.data.repository;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import com.boot.data.entity.Country;
import com.boot.exception.repository.RecordNotFound;
import com.boot.exception.service.NotYetImplementedException;

public interface CountryRepository extends BaseCrudRepository<Country, Long>{
	

}
