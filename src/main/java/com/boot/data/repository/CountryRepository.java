package com.boot.data.repository;

import java.util.List;

import com.boot.data.entity.Country;
import com.boot.data.entity.State;
import com.boot.exception.repository.RecordNotFound;

public interface CountryRepository {
	public List<State> findAllStates(Long id) throws RecordNotFound;
}
