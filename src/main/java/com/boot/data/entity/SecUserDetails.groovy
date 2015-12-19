package com.boot.data.entity

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

class SecUserDetails implements UserDetails{

	User user
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return [new SimpleGrantedAuthority(user.role)]
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
