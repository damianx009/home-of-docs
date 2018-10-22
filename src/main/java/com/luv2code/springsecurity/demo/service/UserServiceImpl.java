package com.luv2code.springsecurity.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springsecurity.demo.dao.AuthorityDAO;
import com.luv2code.springsecurity.demo.dao.UserDAO;
import com.luv2code.springsecurity.demo.entity.Authority;
import com.luv2code.springsecurity.demo.entity.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private AuthorityDAO authorityDao;
	
	@Transactional
	public List<String> getUserNickNames() {
		return userDAO.getUserNicknames();
	}

	@Transactional
	public List<User> getUsers() {
		return userDAO.getUsers();
	}

	@Transactional
	public List<Authority> getAllAthorities() {
		return authorityDao.getAllAuthorities();
	}

	@Transactional
	public void addUser(User newUser) {
		userDAO.addUser(newUser);
	}

	@Transactional
	public void addAuth(Authority auth) {
		authorityDao.saveAuth(auth);
	}

}
