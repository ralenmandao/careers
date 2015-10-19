package com.boot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	@Autowired
	private CustomSuccessHandler customSuccessHandler;
	@Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication().withUser("candidate@yahoo.com").password("candidate").roles("CANDIDATE");
        auth.inMemoryAuthentication().withUser("admin@yahoo.com").password("admin").roles("ADMIN");
        auth.inMemoryAuthentication().withUser("employer@yahoo.com").password("empoyer").roles("EMPLOYER");
    }
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http.authorizeRequests()
			.antMatchers("/", "/home").permitAll()
			.antMatchers("/candidate/**" , "/resume/**").hasRole("CANDIDATE")                                                                                                                                                                                           
			.and().formLogin().loginPage("/login").successHandler(customSuccessHandler)
			.usernameParameter("username").passwordParameter("password")
			.and().csrf().disable()
	        .exceptionHandling().accessDeniedPage("/404");
	}
}
