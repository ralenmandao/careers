package com.boot.data.entity

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

class SecUserDetails implements UserDetails{

	User user
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		def authorities = ['ROLE_ADMIN', 'ROLE_CANDIDATE', 'ROLE_EMPLOYER']
		def simpleGrantedAuthorities = []
		authorities.each{
			simpleGrantedAuthorities << new SimpleGrantedAuthority(it)
		}
		return simpleGrantedAuthorities
	}

	@Override
	public String getPassword() {
		return user.password
	}

	@Override
	public String getUsername() {
		return user.username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true
	}

	@Override
	public boolean isEnabled() {
		return user.enabled
	}
	
}
