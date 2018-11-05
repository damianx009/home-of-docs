package com.luv2code.springsecurity.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springsecurity.demo.entity.UsersFilterPerson;

@Repository
public class UserFilterPersonDAOImpl implements UserFilterPersonDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<UsersFilterPerson> getAllUsersToFilters() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<UsersFilterPerson> filterUsers = session.createQuery("from UsersFilterPerson").getResultList();
		return filterUsers;
	}

	@Override
	public UsersFilterPerson getUserToFilter(int userId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(UsersFilterPerson.class, userId);
	}

}
