package com.boot.data.repository

import com.boot.data.entity.User

interface UserRepo extends BaseRepository<User, Long>{
	User findByUsername(String username)
	User findByEmail(String email)
}
