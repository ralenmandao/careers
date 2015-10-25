package com.boot.exception.repository;

import com.boot.exception.BaseException;

public class MultipleRegisteredUserException extends BaseException {

	public MultipleRegisteredUserException(String message) {
		super(message);
	}

}
