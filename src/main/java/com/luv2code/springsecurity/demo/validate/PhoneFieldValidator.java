package com.luv2code.springsecurity.demo.validate;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PhoneFieldValidator implements ConstraintValidator<PhoneField,Integer>{
	
	@Override
	public boolean isValid(Integer value, ConstraintValidatorContext context) {
		boolean valid = true;
		if(value != null) {
			valid = (value >= 100000000);
		}
		else
			valid = true; // numer telefonu mo¿e byæ pusty
		return valid;
	}

}
