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
	private List<Country> countries = new ArrayList<Country>();
	
	@PostConstruct
	@Override
	public void setupRepository() {
		Country ph = new Country();
		Country usa = new Country();
		
		ph.setCountryId(1);
		usa.setCountryId(2);
		
		ph.setName("Phillippines");
		usa.setName("United States");
//		
//		List<State> phStates = new ArrayList<State>();
//		phStates.add("Pampanga");
//		phStates.add("Baguio");
//		phStates.add("Makati");
//		ph.setStates(phStates);
//		
//		ph.setStates(phStates);
//		
//		List<State> usaStates = new ArrayList<State>();
//		usaStates.add("Las Vegas");
//		usaStates.add("Alabama");
		
//		usa.setStates(usaStates);
//		
//		countries.add(ph);
//		countries.add(usa);
	}

	@Override
	public Country update(Long id, Map<String, Object> keyValues)
			throws RecordNotFound {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Country update(Country object, Map<String, Object> keyValues) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count() {
		return countries.size();
	}

	@Override
	public void delete(Long id) throws RecordNotFound {
		Iterator<Country> i = countries.iterator();
		while(i.hasNext()){
			Country country = i.next();
			if(country.getCountryId() == id){
				i.remove();
				return;
			}
		}
		throw new RecordNotFound("Cannot find country with id " + id);
	}

	@Override
	public void delete(Country arg0) throws RecordNotFound {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Iterable<? extends Country> arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean exists(Long arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Iterable<? extends Country> findAll() {
		return countries;
	}

	@Override
	public Iterable<? extends Country> findAll(Iterable<Long> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends Country> S findOne(Long arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends Country> S save(S user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends Country> Iterable<S> save(Iterable<S> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<State> findAllStates(Long id) throws RecordNotFound {
		Iterator<Country> i = countries.iterator();
		while(i.hasNext()){
			Country country = i.next();
			if(country.getCountryId() == id){
				return country.getStates();
			}
		}
		throw new RecordNotFound("No country was found with id " + id);
	}
}
