package com.boot.data.jdbc

import groovy.sql.Sql

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Component

@Component("GO")
class GroovyOperations {
	Logger logger = LoggerFactory.getLogger(GroovyOperations.class)
	def db
	def sql
	
	GroovyOperations(){
		db = [url: 'jdbc:hsqldb:mem:testdb', user: 'sa', password: '', driver: 'org.hibernate.dialect.HSQLDialect']
	}
	
	def select(def sql, def setValues){
		try{
			sql = Sql.newInstance(db.url, db.user, db.password, db.driver)
			return sql.eachRow(sql,setValues)
		}catch(all){
			logger.error("Cannot execute select query " + sql)
		}
		return null
	}
}
