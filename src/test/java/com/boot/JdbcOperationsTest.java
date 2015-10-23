package com.boot;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.boot.data.jdbc.JdbcOperations;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = BootApplication.class)
@WebAppConfiguration
public class JdbcOperationsTest {

	@Autowired
	private JdbcOperations jdbcOperations;
	
	@Test
	public void contextLoads() {
		Long count = (Long) jdbcOperations.queryForObject("SELECT COUNT(*) FROM CANDIDATE", Long.class);
		assertNotNull(count);
	}

}
