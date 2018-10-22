package com.luv2code.springsecurity.demo.dao;

import java.util.List;

import com.luv2code.springsecurity.demo.entity.Authority;

public interface AuthorityDAO {
	public List<Authority> getAllAuthorities();

	public void saveAuth(Authority auth);
}
