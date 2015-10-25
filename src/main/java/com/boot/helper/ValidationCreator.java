package com.boot.helper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.validation.Errors;
/**
 * ValidationCreator.java
 * Purpose : handle all validation error creation
 * 
 * @author ralen
 *
 */
public class ValidationCreator {
	private Errors errors;
	private String fieldName;
	private String value;
	
	/**
	 * Create a validation instance and assign
	 * @param errors where to attach the errors
	 * @param fieldName the fieldname to attach the errors
	 * @param value the value of the field
	 */
	public ValidationCreator(Errors errors, String fieldName, String value){
		this.errors = errors;
		this.fieldName = fieldName;
		this.value = value;
	}
	
	/**
	 * Checke whether {@code value} is empty
	 * 
	 * @return instance of the validation creator
	 */
	public ValidationCreator validateEmpty(){
		if(value == null){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " is empty");
		}else{
			if(value.length() == 0){
				errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " is empty");
			}
		}
		return this;
	}
	
	/**
	 * Check whether the string contains illegal characters
	 * (allowed characters a-zA-Z0-9_-)
	 * 
	 * @return instance of the validation creator
	 */
	public ValidationCreator validateSafeChar(){
		if(value == null) return this;
		if(!value.matches("^$|[a-zA-Z0-9_-]+")){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " contains invalid character(s)");
		}
		return this;
	}
	
	/**
	 * Check whether the string contains illegal characters
	 * (allowed characters a-zA-Z)
	 * @return instance of validation creator
	 */
	public ValidationCreator validateLettersOnly(){
		if(value == null) return this;
		if(!value.matches("^$|[a-zA-Z]+")){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " contains invalid character(s)");
		}
		return this;
	}
	
	/**
	 * The string must be numbers only
	 * @return instance of validation creator
	 */
	public ValidationCreator validateNumbersOnly(){
		if(value == null) return this;
		if(!value.matches("^$|[0-9]+")){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " contains invalid character(s)");
		}
		return this;
	} 
	
	/**
	 * The string must be either numbers or letters
	 * @return instance of validation creator
	 */
	public ValidationCreator validateNumbersAndLetters(){
		if(value == null) return this;
		if(!value.matches("^$|[a-zA-Z0-9]+")){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " contains invalid character(s)");
		}
		return this;
	} 
	
	/**
	 * Validate the maximum characters of the {@code value}
	 * @param max maximum number of character
	 * @return isntance of the validation creator
	 */
	public ValidationCreator validateMax(int max){
		if(value == null) return this;
		if(value.length() > max){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " maximum of " + max + " character(s)");
		}
		return this;
	}
	
	/**
	 * Validate the minimum characters of the {@code value}
	 * @param min minimum characters
	 * @return instance of the validation creator
	 */
	public ValidationCreator validateMin(int min){
		if(value == null) return this;
		if(value.length() < min && value.length() != 0){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " minimum of " + min + " character(s)");
		}
		return this;
	}
	
	/**
	 * Check whether {@code value} is a valid email address
	 * @return instance of the validation creator
	 */
	public ValidationCreator validateEmail(){
		if(value == null) return this;
		if(!(value.matches("^$|(\\w+@\\w+\\.[a-zA-z]+)"))){
			errors.rejectValue(fieldName, "", fieldName + " invalid email");
		}
		return this;
	}
	
	/**
	 * Check whether the value of {@code value} is the same as the {@code anotherVal}
	 * @param newValue
	 * @return
	 */
	public ValidationCreator validateMatch(String anotherVal){
		if(value == null) return this;
		if(!anotherVal.equals(value)){
			errors.rejectValue(fieldName, "", fieldName + " does not match");
		}
		return this;
	}
}
