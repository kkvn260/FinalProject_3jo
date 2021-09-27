package com.kosta.o2controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.o2dto.O2UserDTO;

@Controller
public class UserController {

	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
}
