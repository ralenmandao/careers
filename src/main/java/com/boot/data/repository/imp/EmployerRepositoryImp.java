package com.boot.data.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.boot.data.entity.Employer;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.EmployerRepository;

@Repository("repEmployer")
public class EmployerRepositoryImp extends AbstractDAO<Long, Employer> implements EmployerRepository{
	@Override
	public String getIdColumnName() {
		return "employerId";
	}

	@Override
	protected String getTableName() {
		// TODO Auto-generated method stub
		return "employer";
	}
}
