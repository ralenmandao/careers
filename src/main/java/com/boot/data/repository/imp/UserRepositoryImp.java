package com.boot.data.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boot.data.entity.User;
import com.boot.data.jdbc.JdbcOperations;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.UserRepository;
import com.boot.exception.repository.MultipleRegisteredUserException;


@Repository("repUser")
public class UserRepositoryImp extends UserRepository{


	@Override
	public String getIdColumnName() {
		return "userId";
	}

	@Override
	protected String getTableName() {
		return "user";
	}

	@Override
	public boolean isEmailExist(String email) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("email", email));
		return crit.list().size() > 0;
	}

}
