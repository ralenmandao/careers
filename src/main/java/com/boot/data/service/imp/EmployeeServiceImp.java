package com.boot.data.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.Employee;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.EmployeeRepository;
import com.boot.data.repository.imp.EmployeeRepositoryImp;
import com.boot.data.service.EmployeeService;

@Service("serEmployee")
@Transactional
public class EmployeeServiceImp extends EmployeeService{

	@Autowired
	@Qualifier("repEmployee")
	private EmployeeRepositoryImp rep;
	
	@Override
	public AbstractDAO<Employee, Long> getRepository() {
		return rep;
	}

}
