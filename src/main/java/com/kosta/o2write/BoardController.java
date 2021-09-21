package com.kosta.o2write;

import org.springframework.stereotype.Controller;

@Controller
public class BoardController {
	
	@Autowired
	private O2Service service;
	
	@RequestMapping("/qnalist")
	public String list(Model model) {
		List<O2QnaBoardDTO> list= service.qnalist();
		model.addAttribute("list",list);
		
		return "writeboard/qnalist";
	}
}
