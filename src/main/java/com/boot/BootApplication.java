package com.boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableAsync
@EnableScheduling
public class BootApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootApplication.class, args);
//    	SpringApplicationBuilder builder = new SpringApplicationBuilder(BootApplication.class);
//    	builder.headless(false);
//    	ConfigurableApplicationContext context = builder.run(args);
//    	
//        try {
//			new File("resources/images/profiles/awe.txt").createNewFile();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
    }
}
