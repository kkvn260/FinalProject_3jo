package com.kosta.o2controller;



import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosta.o2dto.O2FileDTO;
import com.kosta.o2dto.O2WriteBoardDTO;
import com.kosta.o2writeservice.O2WriteService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
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
	@PostMapping("/twriteresult")
	public String twriteresult(O2WriteBoardDTO dto,Model model
								,@RequestParam("filedata")List<MultipartFile> images
								,HttpServletRequest request) {
		
		long sizeSum = 0;
		for(MultipartFile image : images) {
			//용량 검사
			sizeSum += image.getSize();
			if(sizeSum >= LIMIT_SIZE) {
				
				return "writboard/fail";
			}
		}
		service.twriteinsert(dto,images);
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "resources/img/";
		 for (MultipartFile mf : images) {
	            String fileName = mf.getOriginalFilename(); // 원본 파일 명

	            System.out.println("originFileName : " + fileName);

	            String safeFile = root_path + attach_path + fileName;
	            System.out.println(safeFile);
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }

		return "redirect:/mainpage";
	}


	@RequestMapping("/twritedetail/{no}")
	public String twritedetail(HttpServletRequest request,Model model,@PathVariable int no) {
		
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "resources/img/";
		
		
		O2WriteBoardDTO list= service.twritedetail(no);
		List<O2FileDTO> list2=service.tfiledetail(no);
		
		String safeFile = root_path + attach_path;
		model.addAttribute("filepath",safeFile);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "writeboard/writedetail";
	}
	@RequestMapping("/selllist")
	public String selllist(Model model) {
		
		List<O2WriteBoardDTO> list= service.selllist();
		model.addAttribute("list",list);
		
		return "writeboard/selllist";
	}
	@RequestMapping("/deallist")
	public String deallist(Model model) {
		
		List<O2WriteBoardDTO> list=service.deallist();
		model.addAttribute("list",list);
		
		return "writeboard/deallist";
	}
	@RequestMapping("/tdealdetail/{no}")
	public String tdealdetail(HttpServletRequest request,Model model,@PathVariable int no) {

		O2WriteBoardDTO list= service.twritedetail(no);
		model.addAttribute("list",list);

		return "writeboard/dealdetail";
	}
	
}

