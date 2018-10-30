package com.luv2code.springsecurity.demo.service;

import java.util.List;

import com.luv2code.springsecurity.demo.entity.InboundDocument;
import com.luv2code.springsecurity.demo.entity.OutboundDocument;
import com.luv2code.springsecurity.demo.model.SearchedDocuments;

public interface DocumentService {
	
	public List<OutboundDocument> getAllOutboundDocuments();
	
	public List<InboundDocument> getAllIntboundDocuments();
	
	public List<OutboundDocument> searchedOutboundDocuments(SearchedDocuments seachedDocuments);
	
	public List<String> getSourceSystems();
	
	public List<String> getDistributionMethods();
}
