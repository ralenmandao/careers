package com.boot;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.logout.LogoutHandler;

import com.boot.data.entity.UserLoginFailure;
import com.boot.data.jdbc.JdbcOperations;
import com.boot.data.repository.UserLoginFailureRepo;
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
	UserLoginFailureRepo failRepo;
	
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
		http.authorizeRequests()
				.antMatchers("/", "/home", "/employer/register", "/candidate/activate/**", "/employer/activate/**","/candidate/changeEmail/**",
						"/candidate/profilePicture/**", "/candidate/*/myresume", "/candidate/*/myresumedocx" ,
						"/employer/profilePicture/**", "/candidate/document/**", "/candidate/real/**").permitAll()
				.antMatchers("/candidate/**", "/resume/**", "/job/**")
				.hasRole("CANDIDATE")
				.antMatchers("/employer/**")
				.hasRole("EMPLOYER")
				.antMatchers("/admin/**")
				.hasRole("ADMIN").and()
				.formLogin().loginPage("/login")
				.successHandler(customSuccessHandler)
				.usernameParameter("username").passwordParameter("password")
				.failureHandler(new AuthenticationFailureHandler() {
					@Override
					public void onAuthenticationFailure(HttpServletRequest arg0, HttpServletResponse arg1, AuthenticationException arg2)
							throws IOException, ServletException {
						if(arg2 instanceof DisabledException){
							arg1.sendRedirect("/login?disabled");
						}else{
							String ip = arg0.getRemoteAddr();
							UserLoginFailure failure = failRepo.findByIp(ip)
							boolean failed = false
							if(failure == null){
								failure = new UserLoginFailure(date: new Date(), ip : ip, attempt: 1)
								failRepo.save(failure)
								failed = true
							}else{
								def mydate = new Date()
								def faildate = failure.date
//								long hours = (60 * 60 * 60) * 3
								long hours = 1000 * 60
								long diff = (mydate.time - faildate.time)
								if(diff >= hours){
									failure.date = mydate
									failure.attempt = 1
									failRepo.save(failure)
								}else{
									failure.date = mydate
									failure.attempt = failure.attempt + 1
									failRepo.save(failure)
								}
								failed = true
							}
							if(failed){
								arg1.sendRedirect("/login");
							}else
								arg1.sendRedirect("/login?error");
						}
					}
				})
				.and().csrf().disable().exceptionHandling()
				.accessDeniedPage("/login")
				.accessDeniedHandler(new AccessDeniedHandler() {
					@Override
					public void handle(HttpServletRequest arg0, HttpServletResponse arg1,
							AccessDeniedException arg2) throws IOException, ServletException {
//						arg2.printStackTrace();
						arg0.getRequestDispatcher("/404").forward(arg0, arg1);
					}
				}).and().logout().addLogoutHandler(new LogoutHandler() {
					@Override
					public void logout(HttpServletRequest arg0, HttpServletResponse arg1, Authentication arg2) {
						arg0.getSession().removeAttribute("principal");
					}
				});
	}
	
	public String getClientIpAddress(HttpServletRequest request) {
	    for (String header : HEADERS_TO_TRY) {
	        String ip = request.getHeader(header);
	        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
	            return ip;
	        }
	    }
	    return request.getRemoteAddr();
	}
}