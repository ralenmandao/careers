package com.boot.data.entity

import org.springframework.data.annotation.Id

class Article {
	@Id
	String id
	String title
	String message
}
