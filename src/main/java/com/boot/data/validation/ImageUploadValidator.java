package com.boot.data.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.boot.data.entity.FileBucket;
// TODO ImageUploadValidator
public class ImageUploadValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return FileBucket.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		final FileBucket file = (FileBucket)target;
		if(file.getFile().getContentType() != "image/jpeg"){
			errors.reject("", "Invalid Image");
		}
	}

}
