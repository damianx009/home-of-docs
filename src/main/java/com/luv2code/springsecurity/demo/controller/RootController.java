package com.luv2code.springsecurity.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.luv2code.springsecurity.demo.service.DocumentService;

@Controller
public class RootController {

	@Autowired
	private DocumentService documentService;
	
	@GetMapping("/")
	public String showHome() {
		return "home";
	}
	
	@GetMapping("/search")
	public String showSearch() {
		System.out.println(documentService.getAllIntboundDocuments());
		System.out.println(documentService.getAllOutboundDocuments());
		return "search";
	}
	
}
