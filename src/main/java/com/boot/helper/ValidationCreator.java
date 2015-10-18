package com.boot.helper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.validation.Errors;

public class ValidationCreator {
	private Errors errors;
	private String fieldName;
	private String value;
	
	public ValidationCreator(Errors errors, String fieldName, String value){
		this.errors = errors;
		this.fieldName = fieldName;
		this.value = value;
	}
	
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
	
	public ValidationCreator validateSafeChar(){
		if(value == null) return this;
		if(!value.matches("^$|[a-zA-Z0-9_-]+")){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " contains invalid character(s)");
		}
		return this;
	}
	
	public ValidationCreator validateLettersOnly(){
		if(value == null) return this;
		if(!value.matches("^$|[a-zA-Z]+")){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " contains invalid character(s)");
		}
		return this;
	}
	
	public ValidationCreator validateNumbersOnly(){
		if(value == null) return this;
		if(!value.matches("^$|[0-9]+")){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " contains invalid character(s)");
		}
		return this;
	} 
	
	public ValidationCreator validateNumbersAndLetters(){
		if(value == null) return this;
		if(!value.matches("^$|[a-zA-Z0-9]+")){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " contains invalid character(s)");
		}
		return this;
	} 
	
	public ValidationCreator validateMax(int max){
		if(value == null) return this;
		if(value.length() > max){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " maximum of " + max + " character(s)");
		}
		return this;
	}
	
	public ValidationCreator validateMin(int min){
		if(value == null) return this;
		if(value.length() < min && value.length() != 0){
			errors.rejectValue(fieldName, "", fieldName.toLowerCase() + " minimum of " + min + " character(s)");
		}
		return this;
	}
	
	public ValidationCreator validateEmail(){
		if(value == null) return this;
		if(!(value.matches("^$|(\\w+@\\w+\\.[a-zA-z]+)"))){
			errors.rejectValue(fieldName, "", fieldName + " invalid email");
		}
		return this;
	}
	
	public ValidationCreator validateMatch(String newValue){
		if(value == null) return this;
		if(!newValue.equals(value)){
			errors.rejectValue(fieldName, "", fieldName + " does not match");
		}
		return this;
	}
}
