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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.o2dto.O2UserDTO;
import com.kosta.o2service.O2UserService;


@Controller

public class UserController {

	

		private static final Logger logger=LoggerFactory.getLogger(UserController.class);
		
		@Autowired
		private O2UserService service;
		
		// 회원가입
		@GetMapping(value = "/registerForm")
		public String usersign() {
			
			return "member/registerForm";
		}
		@RequestMapping(value = "/registersucess")
		public String usersign(O2UserDTO userdto) {
			service.signUser(userdto);
			return "member/registersucess";
		}
		@RequestMapping(value = "/member/idCheck",method = RequestMethod.GET)
		@ResponseBody
		public int idCheck(@RequestParam("user_id") String user_id) {
			
			return service.userIdCheck(user_id);
		}
		@RequestMapping(value = "/login")
		public String userlogin() {
			return "member/login";
		}
}
