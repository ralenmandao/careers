package com.boot.data.repository;

import java.util.List;

import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

import com.boot.data.entity.User;

public interface UserRepository extends BaseCrudRepository<User, Long>{
	public User findOne(String email, String password);
	public boolean emailExists(String email);
}
