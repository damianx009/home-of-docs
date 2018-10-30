package com.luv2code.springsecurity.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springsecurity.demo.dao.InboundDocumentDAO;
import com.luv2code.springsecurity.demo.dao.OutboundDocumentDAO;
import com.luv2code.springsecurity.demo.entity.InboundDocument;
import com.luv2code.springsecurity.demo.entity.OutboundDocument;
import com.luv2code.springsecurity.demo.model.SearchedDocuments;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Autowired
	private InboundDocumentDAO inboundDocumentDAO;
	
	@Autowired
	private OutboundDocumentDAO outboundDocumentDAO;
	
	
	@Transactional
	public List<OutboundDocument> getAllOutboundDocuments() {
		return outboundDocumentDAO.getAllOutboundDocuments();
	}

	@Transactional
	public List<InboundDocument> getAllIntboundDocuments() {
		return inboundDocumentDAO.getAllIntboundDocuments();
	}

	@Transactional
	public List<OutboundDocument> searchedOutboundDocuments(SearchedDocuments seachedDocuments) {
		return outboundDocumentDAO.getSearchedOutboundDocuments(seachedDocuments);
	}

	@Transactional
	public List<String> getSourceSystems() {
		return outboundDocumentDAO.getSourceSystems();
	}

	@Transactional
	public List<String> getDistributionMethods() {
		return outboundDocumentDAO.getDistributionMethods();
	}
	
}
