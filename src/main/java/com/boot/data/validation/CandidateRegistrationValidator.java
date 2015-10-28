package com.boot.data.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.boot.data.entity.Candidate;
import com.boot.data.entity.CandidateRegistrationEntity;
import com.boot.helper.ValidationCreator;

/**
 * for validating the Candidate at
 * registration process
 * 
 * @author ralen
 *
 */
public class CandidateRegistrationValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return CandidateRegistrationEntity.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		CandidateRegistrationEntity candidate = (CandidateRegistrationEntity) target;
		// validate Firstname
		new ValidationCreator(errors, "firstName", candidate.getFirstName())
				.validateEmpty().validateMax(45).validateLettersOnly();

		// Validate Lastname
		new ValidationCreator(errors, "lastName", candidate.getLastName())
				.validateEmpty().validateMax(45).validateLettersOnly();
		// Validate Email
//		new ValidationCreator(errors, "email", candidate.getUsername())
//				.validateEmpty().validateMax(45).validateEmail();
//		// Validate Password
//		new ValidationCreator(errors, "password", candidate.getPassword())
//				.validateEmpty().validateMin(5).validateMax(45)
//				.validateNumbersAndLetters()
//				.validateMatch(candidate.getRepassword());
		new ValidationCreator(errors, "repassword", candidate.getRepassword())
				.validateEmpty();

	}

}
