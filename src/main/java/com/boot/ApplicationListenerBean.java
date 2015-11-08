package com.boot;

import org.hsqldb.util.DatabaseManagerSwing;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.ContextStoppedEvent;

public class ApplicationListenerBean implements ApplicationListener{

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		 if (event instanceof ContextRefreshedEvent) {
	           ApplicationContext applicationContext = ((ContextRefreshedEvent) event).getApplicationContext();
	           DatabaseManagerSwing.main(new String[] { "--url", "jdbc:hsqldb:mem:testdb", "--user", "sa", "--password", "" });
		 }
	}
	
}
