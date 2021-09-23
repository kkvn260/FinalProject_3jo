package com.kosta.o2write;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {



	@RequestMapping("/mainpage")
	public String list() {

		
		return "include/main";
	}
}
