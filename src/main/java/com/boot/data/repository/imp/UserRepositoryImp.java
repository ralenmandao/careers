package com.boot.data.repository.imp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.boot.data.entity.User;
import com.boot.data.jdbc.DataOperations;
import com.boot.data.jdbc.JdbcOperations;
import com.boot.data.repository.UserRepository;
import com.boot.exception.repository.RecordNotFound;


@Component
public class UserRepositoryImp implements UserRepository{
	private DataOperations operations;
	private HashMap<Long, User> users = new HashMap<Long, User>();
	private long userId = 1;
	
	@Autowired
	public UserRepositoryImp(JdbcOperations operations){
		this.operations = operations;
	}
	@PostConstruct
	@Override
	public void setupRepository() {
		final User user1 = new User("ralen@yahoo.com", "jujukiki", userId++, "ADMIN", "ACTIVE");
		final User user2 = new User("rafael@yahoo.com", "jujukiki", userId++, "CANDIDATE", "ACTIVE");
		final User user3 = new User("judith@yahoo.com", "jujukiki", userId++, "EMPLOYER", "ACTIVE");
		
		users.put(user1.getUserId(), user1);
		users.put(user2.getUserId(), user2);
		users.put(user3.getUserId(), user3);
	}	
	@Override
	public long count() {
		return users.size();
	}
	@Override
	public void delete(Long key) throws RecordNotFound {
		final User user = users.get(key);
		if(user == null){
			throw new RecordNotFound("No user found with ID = " + key);
		}else{
			users.remove(key);
		}
	}
	@Override
	public void delete(User target) throws RecordNotFound {
		final User user = users.get(target.getUserId());
		if(user == null){
			throw new RecordNotFound("No user found with ID = " + target.getUserId());
		}else{
			users.remove(user);
		}
		
	}
	@Override
	public void delete(Iterable<? extends User> i) {
		i.forEach(e -> {
			try {
				delete(e);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		});
	}
	@Override
	public void deleteAll() {
		users.clear();
	}
	@Override
	public boolean exists(Long key) {
		return users.get(key) != null;
	}
	@Override
	public Iterable<User> findAll() {
		return users.values();
	}
	@Override
	public Iterable<User> findAll(Iterable<Long> ids) {
		List<User> lstUser = new ArrayList<User>();
		ids.forEach(e -> {
			if(users.containsKey(e)){
				lstUser.add(users.get(e));
			}
		});
		return lstUser;
	}
	@Override
	public User findOne(String email, String password){
		Iterator<User> i = users.values().iterator();
		while(i.hasNext()){
			User myUser = i.next();
			if(myUser.getEmail().equals(email) && myUser.getPassword().equals(password)){
				return myUser;
			}
		}
		return null;
	}
	

	@Override
	public <S extends User> S save(S target) {
		target.setUserId(userId++);
		users.put(target.getUserId(), target);
		return target;
	}
	@Override
	public <S extends User> Iterable<S> save(Iterable<S> targets) {
		targets.forEach(e -> {
			save(e);
		});
		return targets;
	}


	@Override
	public User findOne(Long target) {
		return users.get(target);
	}
	@Override
	public boolean emailExists(String email) {
		Iterator<User> i = users.values().iterator();
		while(i.hasNext()){
			User u = i.next();
			if(u.getEmail().equals(email)){
				return true;
			}
		}
		return false;
	}
	@Override
	public User update(Long id, Map<String, Object> keyValues)
			throws RecordNotFound {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public User update(User object, Map<String, Object> keyValues) {
		// TODO Auto-generated method stub
		return null;
	}	
}
