package com.luv2code.springsecurity.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.luv2code.springsecurity.demo.entity.UsersFilterType;

@Repository
public class UserFilterTypeDAOImpl implements UserFilterTypeDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<UsersFilterType> getUserFilterTypes() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<UsersFilterType> filterTypes = session.createQuery("from UsersFilterType").getResultList();
		return filterTypes;
	}

}
