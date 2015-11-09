package com.boot.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.boot.data.service.CountryService;
import com.boot.exception.repository.RecordNotFound;

@RestController
public class CountryRestController {
	
	@Autowired
	private CountryService countryServices;
	
	@RequestMapping(value="api/country/{country}/states/", method=RequestMethod.GET)
	public ResponseEntity<List<String>> getCountryList(
			@PathVariable String country) throws RecordNotFound{
		long countryId = Long.parseLong(country);
		//return new ResponseEntity<List<String>>(countryServices.getAll(countryId), HttpStatus.OK);
		return null;
	}
}
