package com.boot;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource(value = {"application.properties"})
public class HibernateConfiguration {
	@Autowired
	private Environment environment;
	
	@Bean
	public DataSource getDataSource() {
//		 final DriverManagerDataSource dataSource = new
//		 DriverManagerDataSource();
//		 dataSource.setDriverClassName("com.mysql.jdbc.Driver");
//		 dataSource.setUrl("jdbc:mysql://localhost:3306/ccscareersdb");
//		 dataSource.setUsername("root");
//		 dataSource.setPassword("root");
//		 System.out.println(WebConfig.class.getResource("/").getPath() +
//		 " a");
//		 return dataSource;
		//System.out.println("Embeded");
		EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
		EmbeddedDatabase db = builder.setType(EmbeddedDatabaseType.HSQL)
				.addScript("crate-db.sql")
				.addScript("insert-db.sql")
				.build();
		return db;
	}
	
	@Bean
	public LocalSessionFactoryBean sessionFactory(){
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(getDataSource());
		sessionFactory.setPackagesToScan("com.boot.data.entity");
		sessionFactory.setHibernateProperties(getHibernateProperties());
		return sessionFactory;
	}
	
	private Properties getHibernateProperties(){
		Properties properties = new Properties();
		properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
		properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
        properties.put("hibernate.format_sql", environment.getRequiredProperty("hibernate.format_sql"));
        return properties;
	}
	
	@Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory s) {
       HibernateTransactionManager txManager = new HibernateTransactionManager();
       txManager.setSessionFactory(s);
       return txManager;
    }
}
