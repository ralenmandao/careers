package com.boot.data.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.User;
import com.boot.data.repository.UserRepository;
import com.boot.data.service.UserService;
import com.boot.exception.repository.MultipleRegisteredUserException;
import com.boot.exception.service.NotYetImplementedException;

@Service
@Transactional
public class UserServiceImp implements UserService{

	private UserRepository userRepository;
	
	public UserServiceImp(){};
	@Autowired
	public UserServiceImp(UserRepository userRepository){
		this.userRepository = userRepository;
	}
	
	@Override
	public User findByUserAndPassword(String email, String password) {
		return userRepository.getByUserAndPassword(email, password);
	}
	@Override
	public boolean emailExist(String email) throws MultipleRegisteredUserException {
		return userRepository.emailExists(email);
	}

}
