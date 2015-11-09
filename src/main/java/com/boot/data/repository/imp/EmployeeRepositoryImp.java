package com.boot.data.repository.imp;

import org.springframework.stereotype.Repository;

import com.boot.data.repository.EmployeeRepository;

@Repository("repEmployee")
public class EmployeeRepositoryImp extends EmployeeRepository{

	@Override
	public String getIdColumnName() {
		return "employeeId";
	}

	@Override
	protected String getTableName() {
		return "employee";
	}

	
}
