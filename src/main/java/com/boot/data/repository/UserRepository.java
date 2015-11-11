package com.boot.data.repository;

import java.io.Serializable;
import java.util.List;

import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

import com.boot.data.entity.EntityObject;
import com.boot.data.entity.User;
import com.boot.exception.repository.MultipleRegisteredUserException;

public abstract class UserRepository<T extends EntityObject, PK extends Serializable> extends AbstractDAO<T, PK>{
	public abstract boolean isEmailExist(String email);
}
