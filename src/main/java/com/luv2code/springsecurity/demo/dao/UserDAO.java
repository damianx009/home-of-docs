package com.luv2code.springsecurity.demo.dao;

import java.util.List;

import com.luv2code.springsecurity.demo.entity.User;

public interface UserDAO {
	public List<String> getUserNicknames();

	public List<User> getUsers();

	public void addUser(User newUser);
}
