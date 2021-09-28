package com.kosta.o2controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.o2dto.O2WriteBoardDTO;
import com.kosta.o2service.O2ServiceOther;

@Controller
public class MainController {

	@Autowired
	private O2ServiceOther service;

	
	@RequestMapping("/mainpage")
	public String main(Model model) {

		  List<O2WriteBoardDTO> list=service.topview();
			 model.addAttribute("list", list);
		
		return "include/mainboard";
	}
}
