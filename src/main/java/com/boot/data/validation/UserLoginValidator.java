package com.boot.data.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.boot.data.entity.User;
import com.boot.helper.ValidationCreator;

public class UserLoginValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		final User user = (User)target;
		// Validate email
		new ValidationCreator(errors, "email", user.getEmail())
				.validateEmpty()
				.validateEmail();
		
		// Validate password
		new ValidationCreator(errors, "password", user.getPassword())
				.validateEmpty()
				.validateNumbersAndLetters();
	}

}
