package com.luv2code.springsecurity.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springsecurity.demo.entity.Authority;

@Repository
public class AuthorityDAOImpl implements AuthorityDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Authority> getAllAuthorities() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Authority> auths = session.createQuery("from Authority").getResultList();
		return auths;
	}

	@Override
	public void saveAuth(Authority auth) {
		Session session = sessionFactory.getCurrentSession();
		session.save(auth);
	}

}
