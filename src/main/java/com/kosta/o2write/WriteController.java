package com.kosta.o2write;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.o2dto.O2DTO;
import com.kosta.o2service.O2Service;

@Controller
public class WriteController {
	@Autowired
	private O2Service service;
	
	@RequestMapping("/write")
	public String twrite() {
		//아이디 가져와서 가입할때 주소 받기 >> 지도에 뿌림
		
		return "writeboard/twrite";
	}
	@RequestMapping("/twriteresult")
	public String twriteresult(O2DTO dto,HttpServletRequest request,Model model) {
		service.writeinsert(dto);

		String x=request.getParameter("x");
		String y=request.getParameter("y");
		
		model.addAttribute("x",x);
		model.addAttribute("y",y);
		return "writeboard/writedetail";
	}
		
	@RequestMapping("/twritedetail")
	public String twritedetail(HttpServletRequest request,Model model) {
//		service.writedetail();
		
		
		String x=request.getParameter("x");
		String y=request.getParameter("y");
		
		model.addAttribute("x",x);
		model.addAttribute("y",y);
		return "writeboard/writedetail";
	}
}
