package com.kosta.o2controller;



import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosta.o2dto.O2FileDTO;
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

	private static final long LIMIT_SIZE = 10 * 1024 * 1024;
	
	//twriteresult
	@RequestMapping("/twriteresult")
	public String twriteresult(O2WriteBoardDTO dto,HttpServletRequest request,Model model
												,@RequestParam("files")List<MultipartFile> images) {
		service.twriteinsert(dto);
		String x=request.getParameter("map_x");
		String y=request.getParameter("map_y");
		
		model.addAttribute("x",x);
		model.addAttribute("y",y);
		
		long sizeSum = 0;
		for(MultipartFile image : images) {
			String originalName = image.getOriginalFilename(); 
			//용량 검사
			sizeSum += image.getSize();
			if(sizeSum >= LIMIT_SIZE) {
				return "writeboard/fail";
			}
		}

		//실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
		//특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
		return "home";
	}


	@RequestMapping("/twritedetail/{no}")
	public String twritedetail(HttpServletRequest request,Model model,@PathVariable int no) {

		O2WriteBoardDTO list= service.twritedetail(no);
		model.addAttribute("list",list);

		return "writeboard/writedetail";
	}
	@RequestMapping("/test")
	public String test() {
		return "writeboard/main";
	}
}

