package com.kosta.o2controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



import com.kosta.o2service.O2Service;

@Controller
public class BoardController {
	@Autowired
	private O2Service service;
	

	@RequestMapping("/main")
	public String list(@RequestParam(required = false, defaultValue = "1") int currPage
	           ,@RequestParam(required = false, defaultValue = "") String search
	           ,@RequestParam(required = false, defaultValue = "") String searchtxt
	           ,Model model) {
		
		
		
		
	
		
		return "list";
	}

	
}
