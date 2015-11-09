package com.boot.data.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.Employer;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.EmployerRepository;
import com.boot.data.service.EmployerService;

@Service("serEmployer")
@Transactional
public class EmployerServiceImp extends EmployerService{

	@Autowired
	@Qualifier("repEmployee")
	private EmployerRepository rep;
	
	@Override
	public AbstractDAO<Employer, Long> getRepository() {
		return rep;
	}
}
