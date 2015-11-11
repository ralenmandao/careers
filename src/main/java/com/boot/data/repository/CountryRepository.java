package com.boot.data.repository;

import java.io.Serializable;

import com.boot.data.entity.Country;
import com.boot.data.entity.EntityObject;

public abstract class CountryRepository<T extends EntityObject, PK extends Serializable> extends AbstractDAO<T, PK>{
	
}
