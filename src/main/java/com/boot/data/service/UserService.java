package com.boot.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.data.entity.User;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.UserRepository;
import com.boot.exception.repository.MultipleRegisteredUserException;

public abstract class UserService extends AbstractService<User, Long>{
	public abstract boolean isEmailExist(String email);
}
