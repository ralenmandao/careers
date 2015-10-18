package com.boot.controller;

import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.*;

public class HomeControllerTest {
	@Test
	public void testHomePage() throws Exception{
		final HomeController controller = new HomeController();
		MockMvc mock = standaloneSetup(controller).build();
		mock.perform(get("/")).andExpect(view().name("home"));
	}
}
