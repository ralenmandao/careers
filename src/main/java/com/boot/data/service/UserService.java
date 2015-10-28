package com.boot.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.data.entity.User;
import com.boot.data.repository.UserRepository;
import com.boot.exception.repository.MultipleRegisteredUserException;

public interface UserService{
	public User findByUserAndPassword(String email, String password);
	public boolean emailExist(String email) throws MultipleRegisteredUserException;
}
