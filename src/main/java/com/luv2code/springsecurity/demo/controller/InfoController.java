package com.luv2code.springsecurity.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luv2code.springsecurity.demo.service.ApplicationService;

@Controller
@RequestMapping("/info")
public class InfoController {

	@Autowired
	private ApplicationService applicationService;
	
	@GetMapping("/profile/{userId}")
	public String getProfile(@PathVariable("userId") int userId,
							 Model model) {
		System.out.println(applicationService.getUserToFilter(userId));
		model.addAttribute("profileDescription",applicationService.getUserToFilter(userId));
		return "profile";
	}
}
