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
	

	@RequestMapping("/selllist")
	public String sellList(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String search,
			@RequestParam(required = false, defaultValue = "") String searchtxt,Model model) {
		
		Pattern pattern = Pattern.compile("(^[0-9]*$)");

		if (search == "user_id" || search.equals("user_id") || search == "title"
			|| search.equals("title") || search == "content" || search.equals("content")) 
		{
			Matcher matcher = pattern.matcher(searchtxt);
			if (matcher.find()) {
				model.addAttribute("searchtxt", searchtxt);
			} else {
				model.addAttribute("searchtxt", "");
			}
		}
		
		int totalCount = service.sellCount(search, searchtxt);
		int pageSize=10;
		int blockSize=5;

		
		//판매게시글 검색 시 db로 저장
		if(!search.equals("") && !searchtxt.equals(""))
			service.searchSellData(search,searchtxt);
		
		O2Page page = new O2Page(currPage, totalCount, pageSize, blockSize);
		List<O2MainBoardDTO> list= service.sellList(search, searchtxt, page.getStartRow(), pageSize);
	
	    
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
				
		
		return "writeboard/selllist";
	}
	
	
	
	@RequestMapping("/deallist")
	public String deallist(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String search,
			@RequestParam(required = false, defaultValue = "") String searchtxt,
			Model model) 
	{
		
		Pattern pattern = Pattern.compile("(^[0-9]*$)");

		if (search == "user_id" || search.equals("user_id") || search == "title"
			|| search.equals("title") || search == "content" || search.equals("content")) 
		{
			Matcher matcher = pattern.matcher(searchtxt);
			if (matcher.find()) {
				model.addAttribute("searchtxt", searchtxt);
			} else {
				model.addAttribute("searchtxt", "");
			}
		}
		
		int totalCount = service.dealCount(search, searchtxt);
		int pageSize=10;
		int blockSize=5;
		
		
		//경매게시글 검색 시 db로 저장
		if(!search.equals("") && !searchtxt.equals(""))
			service.searchDealData(search,searchtxt);
		
		O2Page page = new O2Page(currPage, totalCount, pageSize, blockSize);
		List<O2MainBoardDTO> list= service.dealList(search, searchtxt, page.getStartRow(), pageSize);
		
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		
		return "writeboard/deallist";
	}
		
	
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
