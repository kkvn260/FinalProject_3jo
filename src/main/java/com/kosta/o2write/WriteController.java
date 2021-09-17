package com.kosta.o2write;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.o2service.O2Service;

@Controller
public class WriteController {
	@Autowired
	private O2Service service;
	
	@RequestMapping("/write")
	public String twrite() {
		//아이디 가져와서 가입할때 주소 받기 >> 지도에 뿌림
		
		return "twrite";
	}
	
}
