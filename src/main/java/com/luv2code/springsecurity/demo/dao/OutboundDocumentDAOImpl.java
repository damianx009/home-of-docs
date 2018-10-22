package com.luv2code.springsecurity.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springsecurity.demo.entity.OutboundDocument;

@Repository
public class OutboundDocumentDAOImpl implements OutboundDocumentDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<OutboundDocument> getAllOutboundDocuments() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<OutboundDocument> outs = session.createQuery("from OutboundDocument").getResultList();
		return outs;
	}

}
