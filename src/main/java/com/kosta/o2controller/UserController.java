package com.kosta.o2controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.o2dto.O2UserDTO;
import com.kosta.o2service.O2UserService;

@Controller

public class UserController {

	private static final Logger logger=LoggerFactory.getLogger(UserController.class);
	
	@Inject
	O2UserService service;
	  
	//login
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	//login 처리
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute O2UserDTO dto,HttpSession session) {
		boolean result= service.loginCheck(dto, session);
		ModelAndView mav=new ModelAndView();
		if(result==true) {
			//main
			mav.setViewName("main");
			mav.addObject("msg","success");
			
		}else {
			mav.setViewName("member/login");
			mav.addObject("msg","failure");
		}
		return mav;
	}
	//logout
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		service.logout(session);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/login");
		mav.addObject("msg","logout");
		return mav;
	}
	
	@GetMapping("/register")
	public String register() {
		return "member/registerForm";
	}
	
	@PostMapping("/register")
	public String register(O2UserDTO dto) {
		service.registerUser(dto);
		return "redirect:/login";
	}
}
