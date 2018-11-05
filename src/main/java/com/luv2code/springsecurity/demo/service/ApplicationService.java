package com.luv2code.springsecurity.demo.service;

import java.util.List;

import com.luv2code.springsecurity.demo.entity.UsersFilterPerson;
import com.luv2code.springsecurity.demo.entity.UsersFilterType;

public interface ApplicationService {
	public List<UsersFilterType> getUserFilterTypes();
	public List<UsersFilterPerson> getUsersToFilter();
	public UsersFilterPerson getUserToFilter(int userId);
}
