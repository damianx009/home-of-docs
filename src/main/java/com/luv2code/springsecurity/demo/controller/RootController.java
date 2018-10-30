package com.luv2code.springsecurity.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.luv2code.springsecurity.demo.entity.OutboundDocument;
import com.luv2code.springsecurity.demo.model.SearchedDocuments;
import com.luv2code.springsecurity.demo.service.DocumentService;

@Controller
public class RootController {

	@Autowired
	private DocumentService documentService;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}	
	
//##########################################################################		
	
	@GetMapping("/")
	public String showHome() {
		return "home";
	}
	
	@GetMapping("/search")
	public String showSearch(Model model) {
		model.addAttribute("searched-documents", new SearchedDocuments());
		model.addAttribute("sourceSystems", documentService.getSourceSystems());
		model.addAttribute("distributionMethods", documentService.getDistributionMethods());
		return "search";
	}
	
	@GetMapping("/dictionaries")
	public String getDictPage() {
		return "dictionaries";
	}

//#########################################################################	
	
	@PostMapping("/getOutbounds")
	private String getOutbounds(@ModelAttribute("searched-documents") SearchedDocuments searchedDocuments,
								Model model) {
		
		System.out.println(searchedDocuments);
		List<OutboundDocument> outs = documentService.searchedOutboundDocuments(searchedDocuments);
		model.addAttribute("searchedDocumentsResult",outs);
		model.addAttribute("sourceSystems", documentService.getSourceSystems());
		model.addAttribute("distributionMethods", documentService.getDistributionMethods());
		return "search";
	}
}
