package com.boot.data.repository

import org.springframework.data.mongodb.repository.MongoRepository

import com.boot.data.entity.Article

interface ArticleRepo extends MongoRepository<Article, String>{

}
