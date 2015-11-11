package com.boot.data.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.data.entity.Employer;
import com.boot.data.repository.imp.SampleRepository;

@Service
@Transactional
public class SampleService{
	
	@Autowired
	private SampleRepository sampleRepository;
	
	public List<Employer> getAll(){
		return sampleRepository.getAll();
	}
}
