package com.kosta.o2write;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.o2dto.O2DTO;
import com.kosta.o2dto.O2WriteBoardDTO;
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
	public String twriteresult(O2WriteBoardDTO dto,Model model) {
		service.twriteinsert(dto);

		return "home";//판매게시판으로
	}
		
	@RequestMapping("/twritedetail/{no}")
	public String twritedetail(HttpServletRequest request,Model model,@PathVariable int no) {
		List<O2WriteBoardDTO> list= service.twritedetail(no);
		
		model.addAttribute("list",list);
		
		
		return "writeboard/writedetail";
	}
}
