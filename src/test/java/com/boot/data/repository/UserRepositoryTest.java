package com.boot.data.repository;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.boot.BootApplication;
import com.boot.data.entity.User;
import com.boot.data.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = BootApplication.class)
@WebAppConfiguration
public class UserRepositoryTest {
	
	private static final Logger logger = LoggerFactory.getLogger(UserRepositoryTest.class);

	@Autowired
	private UserService user;
	
	@Test
	public void contextLoads() throws Exception {
		assertNotNull(user);
		assertTrue(user.emailExist("ralencc@yahoo.com"));
		assertFalse(user.emailExist("ra"));
	}

	public User expectedUser(){
		final User user = new User();
		user.setEmail("ralencc@yahoo.com");
		user.setPassword("jujukiki");
		user.setStatus("ACTIVE");
		user.setType("ADMIN");
		return user;
	}
}
