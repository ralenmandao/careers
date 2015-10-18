package com.boot.helper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;

@Component
public class ErrorUtils {
	
	@Autowired
	private MessageSource messageSource;
	
	public List<String> getErrorMessages(Errors errors){
		List<String> myErrors = new ArrayList<String>();
		for (ObjectError fieldError : errors.getAllErrors()) {
			myErrors.add(messageSource.getMessage(fieldError.getCode(), null, null));
		}
		return myErrors;
	}
}
