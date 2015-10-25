package com.boot.data.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.data.entity.User;
import com.boot.data.repository.UserRepository;
import com.boot.data.service.UserService;
import com.boot.exception.service.NotYetImplementedException;

@Service
public class UserServiceImp implements UserService{

	private UserRepository userRepository;
	
	public UserServiceImp(){};
	@Autowired
	public UserServiceImp(UserRepository userRepository){
		this.userRepository = userRepository;
	}
	
	@Override
	public User findByEmailAndPassword(String email, String password) {
		return null;
	}
	@Override
	public boolean emailExist(String email) {
		return true;
	}

}
