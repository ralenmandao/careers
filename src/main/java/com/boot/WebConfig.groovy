package com.boot;

import org.springframework.context.MessageSource
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.support.ResourceBundleMessageSource
import org.springframework.web.servlet.ViewResolver
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter
import org.springframework.web.servlet.view.InternalResourceViewResolver

import com.mongodb.Mongo
import com.mongodb.MongoClient
import com.mongodb.MongoClientURI
@Configuration
@EnableWebMvc
public class WebConfig extends WebMvcConfigurerAdapter {
	@Bean
	public ViewResolver viewResolver() {
		final InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		resolver.setExposeContextBeansAsAttributes(true);
		return resolver;
	}

	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
		messageSource.setBasename("messages");
		messageSource.setAlwaysUseMessageFormat(true);
		return messageSource;
	}
	
// Implementation was transfered to hibernateconfig class
//	@Bean
//	public DataSource getDataSource() {
////		 final DriverManagerDataSource dataSource = new
////		 DriverManagerDataSource();
////		 dataSource.setDriverClassName("com.mysql.jdbc.Driver");
////		 dataSource.setUrl("jdbc:mysql://localhost:3306/ccscareersdb");
////		 dataSource.setUsername("root");
////		 dataSource.setPassword("root");
////		 System.out.println(WebConfig.class.getResource("/").getPath() +
////		 " a");
////		 return dataSource;
//		//System.out.println("Embeded");
////		EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
////		EmbeddedDatabase db = builder.setType(EmbeddedDatabaseType.HSQL)
////				.addScript("crate-db.sql")
////				.addScript("insert-db.sql")
////				.build();
////		return db;
//	}

//	@Bean
//	public Sql getSql(){
//		//def db = [url:'jdbc:hsqldb:mem:testDB', user:'sa', password:'', driver:'org.hsqldb.jdbc.JDBCDriver']
//		def db = [url:'jdbc:mysql://127.0.0.1:3306/ccscareersdb', user:'root', password:'root', driver:'com.mysql.jdbc.Driver']
//		def sql = Sql.newInstance(db.url, db.user, db.password, db.driver)
//		return sql
//	}
//	
//	@Bean
//	@Autowired
//	public JdbcTemplate getJdbcTemplate(DataSource dataSource) {
//		final JdbcTemplate template = new JdbcTemplate(dataSource);
//		return template;
//	}

	@Override
	public void configureDefaultServletHandling(
			DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/WEB-INF/resources/**");
	}
}
