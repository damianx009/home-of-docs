package com.luv2code.springsecurity.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springsecurity.demo.dao.UserFilterPersonDAO;
import com.luv2code.springsecurity.demo.dao.UserFilterTypeDAO;
import com.luv2code.springsecurity.demo.entity.UsersFilterPerson;
import com.luv2code.springsecurity.demo.entity.UsersFilterType;

@Service
public class ApplicationServiceImpl implements ApplicationService {

	@Autowired
	private UserFilterTypeDAO userFilterTypeDao;
	
	@Autowired
	private UserFilterPersonDAO userFilterPersonDAO;
	
	@Transactional
	public List<UsersFilterType> getUserFilterTypes() {
		return userFilterTypeDao.getUserFilterTypes();
	}

	@Transactional
	public List<UsersFilterPerson> getUsersToFilter() {
		return userFilterPersonDAO.getAllUsersToFilters();
	}

	@Transactional
	public UsersFilterPerson getUserToFilter(int userId) {
		return userFilterPersonDAO.getUserToFilter(userId);
	}

}
