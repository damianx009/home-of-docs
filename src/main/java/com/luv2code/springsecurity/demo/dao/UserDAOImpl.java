package com.luv2code.springsecurity.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springsecurity.demo.entity.User;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<String> getUserNicknames() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<String> users = session.createQuery("select username from User").getResultList();
	  return users;
	}

	@Override
	public List<User> getUsers() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<User> users = session.createQuery("from User").getResultList();
	  return users;
	}

	@Override
	public void addUser(User newUser) {
		Session session = sessionFactory.getCurrentSession();
		session.save(newUser);
	}
}
