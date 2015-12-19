package com.boot;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.access.AccessDeniedHandler;

import com.boot.data.jdbc.JdbcOperations;
import com.boot.data.service.imp.SecUserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	@Autowired
	private CustomSuccessHandler customSuccessHandler;
	@Autowired
	private DataSource dataSource;
	@Autowired
	private JdbcOperations operations;
	@Autowired
	private SecUserDetailsService userDetailsService;
	
	
	@Autowired
	public void configGlobalSecurity(AuthenticationManagerBuilder auth)
			throws Exception {
//		auth.jdbcAuthentication().dataSource(dataSource)
//				.usersByUsernameQuery("select username,password,enabled from user where username=?")
//				.authoritiesByUsernameQuery("select username,role from user where username=?");
//				//.passwordEncoder(encoder);
		auth.userDetailsService(userDetailsService);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/", "/home").permitAll()
				.antMatchers("*").permitAll()
				.antMatchers("/candidate/**", "/resume/**", "/job/**")
				.hasRole("CANDIDATE")
				.antMatchers("/employer/**")
				.hasRole("EMPLOYER").and()
				.formLogin().loginPage("/login")
				.successHandler(customSuccessHandler)
				.usernameParameter("username").passwordParameter("password")
				.and().csrf().disable().exceptionHandling()
				.accessDeniedPage("/login")
				.accessDeniedHandler(new AccessDeniedHandler() {
					
					@Override
					public void handle(HttpServletRequest arg0, HttpServletResponse arg1,
							AccessDeniedException arg2) throws IOException, ServletException {
						arg2.printStackTrace();
						arg0.getRequestDispatcher("/404").forward(arg0, arg1);
					}
				});
	}
}
