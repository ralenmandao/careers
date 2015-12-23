package com.boot;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.config.AbstractMongoConfiguration;

import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;

@Configuration
public class MongoConfig extends AbstractMongoConfiguration{

	@Override
	protected String getDatabaseName() {
		return "careers";
	}

	@Override
	public Mongo mongo() throws Exception {
		String dbURI = "mongodb://ralen:ralen@ds051523.mongolab.com:51523/careers";
		MongoClient mongoClient = new MongoClient(new MongoClientURI(dbURI));
		return mongoClient;
	}
	
}
