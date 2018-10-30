package com.luv2code.springsecurity.demo.dao;

import java.util.List;

import com.luv2code.springsecurity.demo.entity.OutboundDocument;
import com.luv2code.springsecurity.demo.model.SearchedDocuments;

public interface OutboundDocumentDAO {
	public List<OutboundDocument> getAllOutboundDocuments();

	public List<OutboundDocument> getSearchedOutboundDocuments(SearchedDocuments seachedDocuments);

	public List<String> getSourceSystems();

	public List<String> getDistributionMethods();
}
