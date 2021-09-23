package com.kosta.o2controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {



	@RequestMapping("/mainpage")
	public String list() {

		
		return "include/main";
	}
}
