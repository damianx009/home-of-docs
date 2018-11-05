package com.luv2code.springsecurity.demo.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.luv2code.springsecurity.demo.validate.FieldMatch;
import com.luv2code.springsecurity.demo.validate.IdentityNickname;
import com.luv2code.springsecurity.demo.validate.PhoneField;


@FieldMatch(first = "password", second = "repeatPassword", message = "{register.password.differentPasswords}")
public class UserRegistration {
	
	
	@NotNull(message="{register.notNull}")
	@Size(min=8, max=20, message="{register.login.lenght}")
	@IdentityNickname(message="{register.login.alreadyExist}")
	private String login;
	
	@NotNull(message="{register.notNull}")
	@Size(min=8, max=20, message="{register.password.lenght}")
	@Pattern(regexp="((?=.*[a-z])(?=.*[0-9])(?=.*[@#$%])(?=.*[A-Z]).{8,20})", 
			 message="{register.password.invalidCharacters}")
	private String password;
	
	@NotNull(message="{register.notNull}")
	private String repeatPassword;
	
	@NotNull(message="{register.notNull}")
	@Pattern(regexp="^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$", message="{register.email.invalid}")
	private String email;
	
	@PhoneField(message="{register.phoneno.invalid}")
	private Integer phone;

//#####################################################
	public UserRegistration() {}

	public UserRegistration(String login, 
							String password, 
							String repeatPassword, 
							String email, 
							Integer phone) {
		this.login = login;
		this.password = password;
		this.repeatPassword = repeatPassword;
		this.email = email;
		this.phone = phone;
	}
//#####################################################	

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepeatPassword() {
		return repeatPassword;
	}

	public void setRepeatPassword(String repeatPassword) {
		this.repeatPassword = repeatPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}
//############################################################

	@Override
	public String toString() {
		return "UserRegistration [login=" + login + ", password=" + password + ", repeatPassword=" + repeatPassword
				+ ", email=" + email + ", phone=" + phone + "]";
	}
	
}
