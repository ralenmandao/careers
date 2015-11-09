package com.boot.data.repository;

import java.util.List;

import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

import com.boot.data.entity.User;
import com.boot.exception.repository.MultipleRegisteredUserException;

public abstract class UserRepository extends AbstractDAO<User, Long>{
	public abstract boolean isEmailExist(String email);
}
