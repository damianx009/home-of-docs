package com.luv2code.springsecurity.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springsecurity.demo.entity.InboundDocument;

@Repository
public class InboundDocumentDAOImpl implements InboundDocumentDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<InboundDocument> getAllIntboundDocuments() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<InboundDocument> ins = session.createQuery("from InboundDocument").getResultList();
		return ins;
	}

}
