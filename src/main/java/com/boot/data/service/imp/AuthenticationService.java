package com.boot.data.service.imp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.boot.data.entity.UserInfo;
import com.boot.data.jdbc.JdbcOperations;

@Service
public class AuthenticationService implements UserDetailsService{

	@Autowired
	private JdbcOperations operations;
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		UserDetails user = operations.queryForObject("SELECT username,password,role FROM user", new Object[]{ username }, new RowMapper<UserInfo>(){

			@Override
			public UserInfo mapRow(ResultSet rs, int row) throws SQLException {
				UserInfo info = new UserInfo();
				info.setUsername(rs.getString("username"));
				info.setPassword(rs.getString("password"));
				info.setAccountNonExpired(true);
				info.setAccountNonLocked(true);
				List<GrantedAuthority> controls = new ArrayList<GrantedAuthority>();
				controls.add(new GrantedAuthority() {
					
					@Override
					public String getAuthority() {
						return "CANDIDATE";
					}
				});
				info.setAuthorities(controls);
				info.setCredentialsNonExpired(true);
				info.setEnabled(true);
				return info;
			}
			
		});
		return user;
	}

}
