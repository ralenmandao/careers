package com.boot;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.config.AbstractMongoConfiguration;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;

import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;

@Configuration
public class MongoConfig extends AbstractMongoConfiguration{

	@Bean
	public GridFsTemplate gridFsTemplate() throws Exception {
		return new GridFsTemplate(mongoDbFactory(), mappingMongoConverter());
	}
	
	@Override
	protected String getDatabaseName() {
//		return "CloudFoundry_kdmp10po_auqnmdlh";
		return "local";
	}

	@Override
	public Mongo mongo() throws Exception {
//		String dbURI = "mongodb://CloudFoundry_kdmp10po_auqnmdlh_u5e6ema3:Lix0kl43QFIFHGm0pheSlrfGNKU4xdXe@ds041934.mongolab.com:41934/CloudFoundry_kdmp10po_auqnmdlh";
		String dbURI = "mongodb://localhost:27017/local";
		MongoClient mongoClient = new MongoClient(new MongoClientURI(dbURI));
		return mongoClient;
	}
	
}
