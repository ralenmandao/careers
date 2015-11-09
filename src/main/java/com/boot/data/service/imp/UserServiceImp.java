package com.boot.data.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.User;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.UserRepository;
import com.boot.data.service.UserService;
import com.boot.exception.repository.MultipleRegisteredUserException;
import com.boot.exception.service.NotYetImplementedException;

@Service
@Transactional
public class UserServiceImp extends UserService{

	@Autowired
	@Qualifier("repUser")
	private UserRepository rep;
	


	@Override
	public boolean isEmailExist(String email) {
		return rep.isEmailExist(email);
	}



	@Override
	public AbstractDAO<User, Long> getRepository() {
		// TODO Auto-generated method stub
		return rep;
	}

}
