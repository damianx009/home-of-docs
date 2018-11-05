package com.luv2code.springsecurity.demo.dao;

import java.util.List;

import com.luv2code.springsecurity.demo.entity.UsersFilterPerson;

public interface UserFilterPersonDAO {
	public List<UsersFilterPerson> getAllUsersToFilters();

	public UsersFilterPerson getUserToFilter(int userId);
}
