package com.luv2code.springsecurity.demo.service;

import java.util.List;

import com.luv2code.springsecurity.demo.entity.InboundDocument;
import com.luv2code.springsecurity.demo.entity.OutboundDocument;

public interface DocumentService {
	
	public List<OutboundDocument> getAllOutboundDocuments();
	
	public List<InboundDocument> getAllIntboundDocuments();
}
