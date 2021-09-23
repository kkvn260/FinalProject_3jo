package com.kosta.o2write;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.kosta.o2dto.O2QnaBoardDTO;

import com.kosta.o2service.O2Service;
import com.kosta.o2service.O2ServiceOther;

@Controller
public class BoardController {
	@Autowired
	private O2Service service;
	@Autowired
	private O2ServiceOther service2;
	

	@RequestMapping("/main")
	public String list(@RequestParam(required = false, defaultValue = "1") int currPage
	           ,@RequestParam(required = false, defaultValue = "") String search
	           ,@RequestParam(required = false, defaultValue = "") String searchtxt
	           ,Model model) {
		
		
		
		
	
		
		return "list";
	}

	@RequestMapping("/qnalist")
	public String list(Model model) {
		List<O2QnaBoardDTO> list= service2.qnalist();
		model.addAttribute("list",list);
		
		return "writeboard/qnalist";
	}
	
}
