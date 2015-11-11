package com.boot.data.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.boot.data.entity.Employer;
import com.boot.data.repository.AbstractDAO;

@Repository
public class SampleRepository extends AbstractDAO<Employer, Long>{

	@Override
	protected String getTableName() {
		return "employer";
	}

	@Override
	protected String getIdColumnName() {
		return "employerId";
	}
	
	@Override
	public List<Employer> getAll(){
		Criteria crit = createEntityCriteria();
		return crit.list();
	}
}
