package com.boot.data.repository.imp

import groovy.sql.Sql

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

import com.boot.data.entity.User
import com.boot.data.repository.UserRepo

@Repository
class UserRepoImp implements UserRepo{

	@Autowired
	Sql sql
	
	def convertToUser = { row ->
		return new User(userId: row.userId, username: row.username, password: row.password, role: row.role,
			enabled: row.enabled, email: row.email)
	}
	
	@Override
	public void add(User t) {
		t.userId = sql.executeInsert("""
			INSERT INTO user VALUES(?,?,?,?,?,?)
		""", [null, t.username, t.password, t.role,t.enabled, t.email])[0][0]
	}

	@Override
	public User get(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<User> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> getAll() {
		sql.rows("""SELECT * FROM user""")
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User findByUsername(String username) {
		def row = sql.firstRow("SELECT * FROM user WHERE username=${username}")
		if(!row) return null
		else convertToUser(row)
	}

	@Override
	public User findByEmail(String email) {
		def row = sql.firstRow("SELECT * FROM user WHERE email=${email}")
		println row
		if(!row) return null
		else convertToUser(row)
	}

}
