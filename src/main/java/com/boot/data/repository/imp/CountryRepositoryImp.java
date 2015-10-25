package com.boot.data.repository.imp;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.boot.data.entity.Country;
import com.boot.data.entity.State;
import com.boot.data.repository.CountryRepository;
import com.boot.exception.repository.RecordNotFound;

@Component
public class CountryRepositoryImp implements CountryRepository{

	@Override
	public List<State> findAllStates(Long id) throws RecordNotFound {
		// TODO Auto-generated method stub
		return null;
	}
	
}
