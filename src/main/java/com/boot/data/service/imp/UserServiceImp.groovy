package com.boot.data.service.imp


import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

import com.boot.data.entity.User
import com.boot.data.repository.UserRepo
import com.boot.data.service.UserService

@Service
class UserServiceImp implements UserService{

	@Autowired
	UserRepo userRepo
	
	@Override
	public void add(User t) {
		userRepo.add(t)
	}

	@Override
	public User get(Long pk) {
		userRepo.get(pk)
	}

	@Override
	public void addAll(List<User> lst) {
		userRepo.addAll(lst)
	}

	@Override
	public void remove(Long pk) {
		userRepo.remove(pk)
	}

	@Override
	public List<User> getAll() {
		return userRepo.getAll()
	}

	@Override
	public void update(User user) {
		userRepo.update(user)
	}

	@Override
	public User findByUsername(String username) {
		userRepo.findByUsername(username)
	}

	@Override
	public User findByEmail(String email) {
		userRepo.findByEmail(email)
	}

}
