package com.boot;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class BootApplication {

    public static void main(String[] args) {
        //SpringApplication.run(BootApplication.class, args);
    	SpringApplicationBuilder builder = new SpringApplicationBuilder(BootApplication.class);
    	builder.headless(false);
    	ConfigurableApplicationContext context = builder.run(args);
    	
    }
}
