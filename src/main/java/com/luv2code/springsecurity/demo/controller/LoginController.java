package com.luv2code.springsecurity.demo.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.luv2code.springsecurity.demo.entity.Authority;
import com.luv2code.springsecurity.demo.entity.User;
import com.luv2code.springsecurity.demo.model.UserRegistration;
import com.luv2code.springsecurity.demo.service.UserService;

@Controller
public class LoginController {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	
	@GetMapping("/login")
	public String showLoginForm() {
		return "login-form";
	}
	
	@GetMapping("/register")
	public String showRegisterForm(Model model) {
		model.addAttribute("newUser",new UserRegistration());
		return "register-form";
	}
	
	@PostMapping("/processRegisterForm")
	public String processRegistration(@Valid @ModelAttribute("newUser") UserRegistration newUser,
									  BindingResult theBindingResult,
									  RedirectAttributes redirectAttributes) {
		

		if(theBindingResult.hasErrors()) {
			return "register-form";
		}
		else {	
			String phone;
			if (newUser.getPhone()==null)
				phone ="";
			else
				phone = newUser.getPhone().toString();
				
			User user = new User(newUser.getLogin(),
								 passwordEncoder.encode(newUser.getPassword()),
								 newUser.getEmail(),
								 phone,
								 1);
			Authority auth = new Authority(newUser.getLogin(),"ROLE_CUSTOMER");
			
			userService.addUser(user);
			userService.addAuth(auth);
			
			redirectAttributes.addAttribute("successRegistration", "true");
			return "redirect:/login";
		}
	}
	
	@GetMapping("/access-denied")
	public String showAccessDeniedPage() {
		return "access-denied";
	}
}
