package com.boot.data.service

import com.boot.data.entity.User

interface UserService extends BaseService<User, Long>{
	User findByUsername(String username)
	User findByEmail(String email)
}
