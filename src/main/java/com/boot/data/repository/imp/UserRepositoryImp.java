package com.boot.data.repository.imp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.boot.data.entity.User;
import com.boot.data.jdbc.DataOperations;
import com.boot.data.jdbc.JdbcOperations;
import com.boot.data.repository.UserRepository;
import com.boot.exception.repository.MultipleRegisteredUserException;
import com.boot.exception.repository.RecordNotFound;


@Component
public class UserRepositoryImp implements UserRepository{
	private DataOperations operations;
	
	@Autowired
	public UserRepositoryImp(JdbcOperations operations){
		this.operations = operations;
	}

	@Override
	public boolean emailExists(String email) throws MultipleRegisteredUserException {
		long count = (long) operations.queryForObject("SELECT COUNT(*) WHERE", Long.class);
		if(count > 1){
			throw new MultipleRegisteredUserException("Email " + email + " is registered twice");
		}else if(count == 1){
			return true;
		}else{
			return false;
		}
	}
	
	@Override
	public void setupRepository() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User update(Long id, Map<String, Object> keyValues)
			throws RecordNotFound {
		// get all the key on the map and contruct a SQL field names
		Iterator<String> iColumnName = keyValues.keySet().iterator();
		String columnNames = "";
		while(iColumnName.hasNext()){
			String column = iColumnName.next();
			if(iColumnName.hasNext()){
				columnNames.concat(column.concat(","));
			}else{
				columnNames.concat(column);
			}
		}
		
		// get all the values on the map and construct a values for sql
		Iterator<Object> iValues = keyValues.values().iterator();
		String values = "";
		while(iValues.hasNext()){
			Object value = iValues.next();
			if(iValues.hasNext()){
				if(value instanceof Integer){
					//values.concat()
				}else{
					
				}
			}else{
				if(value instanceof Integer){
					
				}else{
					
				}
			}
		}
		
		//String columns = 
		return null;
	}

	@Override
	public User update(User object, Map<String, Object> keyValues) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void delete(Long arg0) throws RecordNotFound {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(User arg0) throws RecordNotFound {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Iterable<? extends User> arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean exists(Long arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Iterable<? extends User> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterable<? extends User> findAll(Iterable<Long> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends User> S findOne(Long arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends User> S save(S user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends User> Iterable<S> save(Iterable<S> arg0) {
		// TODO Auto-generated method stub
		return null;
	}
	
	private class BasicUserRowMapper implements RowMapper<User>{
		@Override
		public User mapRow(ResultSet rs, int row) throws SQLException {
			final User user = new User();
			user.setUserId(rs.getLong("userId"));
			return user;
		}
	}
	
	private class CompleteUserRowMapper implements RowMapper<User>{
		@Override
		public User mapRow(ResultSet rs, int row) throws SQLException {
			final User user = new User();
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setUserId(rs.getLong("userId"));
			return user;
		}
	}
	
}
