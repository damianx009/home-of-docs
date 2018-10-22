package com.luv2code.springsecurity.demo.service;

import java.util.List;

import com.luv2code.springsecurity.demo.entity.Authority;
import com.luv2code.springsecurity.demo.entity.User;


public interface UserService {
	public List<String> getUserNickNames();
	
	public List<User> getUsers();
	
	public List<Authority> getAllAthorities();
	
	public void addUser(User newUser);
	
	public void addAuth(Authority auth);
}
