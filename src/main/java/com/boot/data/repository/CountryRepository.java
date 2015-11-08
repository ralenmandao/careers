package com.boot.data.repository;

import java.util.List;

import com.boot.data.entity.Country;
import com.boot.data.entity.State;
import com.boot.exception.repository.RecordNotFound;

public abstract class CountryRepository extends AbstractDAO<Long, Country>{
}
