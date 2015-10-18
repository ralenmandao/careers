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
	public void setupService() {
	}

	@Override
	public User insert(User object) throws Exception {
		return userRepository.save(object);
	}

	@Override
	public User update(User object) throws Exception {
		throw new NotYetImplementedException("UserService");
	}

	@Override
	public void delete(User object) throws Exception {
		throw new NotYetImplementedException("UserService");
	}

	@Override
	public User findById(Long id) throws Exception {
		throw new NotYetImplementedException("UserService");
	}

	@Override
	public User findByEmailAndPassword(String email, String password) {
		User user = userRepository.findOne(email, password);
		System.out.println(user);
		return user;
	}
	@Override
	public boolean emailExist(String email) {
		return userRepository.emailExists(email);
	}

}
