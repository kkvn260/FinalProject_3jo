package com.kosta.o2controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.o2service.O2UserService;

@Controller
public class UserController {

	@Autowired
	O2UserService service;
	  
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
}
