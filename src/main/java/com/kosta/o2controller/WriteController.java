package com.kosta.o2controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.o2dto.O2WriteBoardDTO;
import com.kosta.o2writeservice.O2WriteService;

@Controller
public class WriteController {
	
	@Autowired
	private O2WriteService service;
	
	@RequestMapping("/write")
	public String twrite() {
		//아이디 가져와서 가입할때 주소 받기 >> 지도에 뿌림
		
		return "writeboard/twrite";
	}
	//twriteresult
	@RequestMapping("/twriteresult")
	public String twriteresult(O2WriteBoardDTO dto,HttpServletRequest request,Model model) {
		service.twriteinsert(dto);
		
		String x=request.getParameter("map_x");
		String y=request.getParameter("map_y");
		
		model.addAttribute("x",x);
		model.addAttribute("y",y);
		
		return "home";
	}
		

	@RequestMapping("/twritedetail/{no}")
	public String twritedetail(HttpServletRequest request,Model model,@PathVariable int no) {
		
		O2WriteBoardDTO list= service.twritedetail(no);
		model.addAttribute("list",list);

		return "writeboard/writedetail";
	}
}
