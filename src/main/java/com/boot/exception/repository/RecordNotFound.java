package com.boot.exception.repository;

import com.boot.exception.BaseException;


public class RecordNotFound extends BaseException{

	public RecordNotFound(String message) {
		super(message);
	}

}
