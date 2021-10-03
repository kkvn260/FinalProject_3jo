package com.kosta.o2controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2MainBoardDTO;
import com.kosta.o2dto.O2Page;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2service.O2Service;
import com.kosta.o2service.O2ServiceOther;

@Controller
public class BoardController {
	@Autowired
	private O2Service service;
	 
	@Autowired
	private O2ServiceOther service2;
	
	@RequestMapping("/qnalist")
	public String list(Model model) {
		List<O2QnaBoardDTO> list=service2.qnalist();
		model.addAttribute("list",list);
		
		return "writeboard/qnalist";
	}
	
	@RequestMapping("/dongcomlist")
	public String donglist(Model model) {
		List<O2DongComDTO> list=service2.dongcomlist();
		model.addAttribute("list",list);
		
		return "writeboard/dongcomlist";
	}

}
