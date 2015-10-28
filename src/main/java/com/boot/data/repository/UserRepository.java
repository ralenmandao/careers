package com.boot.data.repository;

import java.util.List;

import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

import com.boot.data.entity.User;
import com.boot.exception.repository.MultipleRegisteredUserException;

public interface UserRepository{
	public boolean emailExists(String email) throws MultipleRegisteredUserException;
	public User getByUserAndPassword(String username, String password);
}
