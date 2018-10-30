package com.luv2code.springsecurity.demo.validate;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.luv2code.springsecurity.demo.service.UserService;

public class IdentityNickNameValidator implements ConstraintValidator<IdentityNickname,String>{

	@Autowired
	private UserService userService;
	
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		boolean valid = false;
		if(value != null) {
			valid = !userService.getUserNickNames().contains(value);
		}
		else
			valid = true;
		return valid;
	}

}
