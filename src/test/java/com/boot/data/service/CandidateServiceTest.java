package com.boot.data.service;

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
import com.boot.data.entity.Candidate;
import com.boot.data.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = BootApplication.class)
@WebAppConfiguration
public class CandidateServiceTest {
	
	private static final Logger logger = LoggerFactory.getLogger(CandidateServiceTest.class);

	@Autowired
	private CandidateService candidateService;
	
	@Test
	public void contextLoads() throws Exception {
		assertTrue(true);
	}

}
