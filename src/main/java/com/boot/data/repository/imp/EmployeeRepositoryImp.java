package com.boot.data.repository.imp;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.boot.data.entity.Employee;
import com.boot.data.entity.Employer;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.EmployerRepository;

@Repository("repEmployee")
public class EmployeeRepositoryImp extends AbstractDAO<Long, Employee> implements EmployerRepository{

	@Override
	public String getIdColumnName() {
		return "employeeId";
	}

	@Override
	protected String getTableName() {
		return "employee";
	}

	
}
