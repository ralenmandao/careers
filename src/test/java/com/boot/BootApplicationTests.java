package com.boot;

import static org.junit.Assert.*;

import javax.validation.constraints.AssertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.boot.data.entity.CandidateRegistrationEntity;
import com.boot.data.entity.Entity;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = BootApplication.class)
@WebAppConfiguration
public class BootApplicationTests {

	@Test
	public void contextLoads() {
		CandidateRegistrationEntity entity = new CandidateRegistrationEntity();
		assertTrue(entity instanceof Entity);
	}

}
