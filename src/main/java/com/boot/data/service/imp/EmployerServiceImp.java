package com.boot.data.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.Employer;
import com.boot.data.repository.imp.EmployerRepositoryImp;
import com.boot.data.service.EmployerService;

@Service("serEmployer")
@Transactional
public class EmployerServiceImp implements EmployerService{

	@Autowired
	@Qualifier("repEmployer")
	private EmployerRepositoryImp repEmployer;
	
	public List<Employer> getAll(){
		return repEmployer.getAll();
	}
}
