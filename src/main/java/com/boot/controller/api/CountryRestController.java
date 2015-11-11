package com.boot.controller.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.boot.data.entity.Country;
import com.boot.data.service.CountryService;
import com.boot.exception.repository.RecordNotFound;

@RestController
public class CountryRestController {
	
	@Autowired
	private CountryService countryServices;
	
	
	@RequestMapping(value="api/country/{country}", method=RequestMethod.GET)
	public ResponseEntity<List<Country>> getCountryList(
			@PathVariable String country) throws RecordNotFound{
		List<Country> countries = new ArrayList<Country>();
		Country myCountry = new Country();
		myCountry.setCountryId(1);
		myCountry.setName(country);
		
		countries.add(myCountry);
		return new ResponseEntity<List<Country>>(countries,HttpStatus.OK);
	}
}
