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


@Repository("userRepository")
public class UserRepositoryImp extends AbstractDAO<Integer, User> implements UserRepository{
	// private DataOperations operations;
	
	@Autowired
	public UserRepositoryImp(JdbcOperations operations){
		//this.operations = operations;
	}

	@Override
	public boolean emailExists(String email) throws MultipleRegisteredUserException {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("username", email));
		List<?> results = crit.list();
		if(results.size() > 1){
			throw new MultipleRegisteredUserException("Multiple user register with email " + email);
		}
		return results.size() != 0;
	}

	@Override
	public User getByUserAndPassword(String username, String password) {
		Criteria crit = createEntityCriteria();
		Criterion cUsername = Restrictions.eq("username", username);
		Criterion cPassword = Restrictions.eq("password", password);
		LogicalExpression lUserAndPassword = Restrictions.and(cUsername, cPassword);
		crit.add(lUserAndPassword);
		return (User) crit.uniqueResult();
	}

}
