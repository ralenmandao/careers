package com.boot.data.service.imp

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.stereotype.Component

import com.boot.data.entity.SecUserDetails
import com.boot.data.entity.User
import com.boot.data.repository.UserRepo

@Component
public class SecUserDetailsService implements UserDetailsService {
	
	@Autowired
	UserRepo repo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = repo.findByUsername(username)
		if (user == null) {
			throw new UsernameNotFoundException("Username not found %{username}")
		}else{
			return new SecUserDetails(user: user)
		}
	}
	
}
