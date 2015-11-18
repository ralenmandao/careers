package com.boot.data.service.imp

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.stereotype.Component

import com.boot.data.entity.Candidate
import com.boot.data.entity.SecUserDetails
import com.boot.data.repository.GCandidateRepository;

@Component
public class SecUserDetailsService implements UserDetailsService {
	
	@Autowired
	GCandidateRepository repo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Candidate candidate = repo.findByUserUsername(username)
		if (candidate == null) {
			throw new UsernameNotFoundException("Username not found %{username}")
		}else{
			return new SecUserDetails(user: candidate.getUser())
		}
	}
	
}
