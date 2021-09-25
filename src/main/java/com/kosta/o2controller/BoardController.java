package com.kosta.o2controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.o2dto.O2MainBoardDTO;
import com.kosta.o2dto.O2Page;
import com.kosta.o2service.O2Service;

@Controller
public class BoardController {
	@Autowired
	private O2Service service;

	@RequestMapping("/main")
	public String list(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String search,
			@RequestParam(required = false, defaultValue = "") String searchtxt, Model model) {

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
		
		int totalCount = service.totalCount(search, searchtxt);
		int pageSize=10;
		int blockSize=5;
		
		O2Page page = new O2Page(currPage, totalCount, pageSize, blockSize);
		List<O2MainBoardDTO> getList = service.searchList(search, searchtxt, pageSize, blockSize);
		
		model.addAttribute("list",getList);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);

		//보낼 곳 지정
		return "";
	}

}
