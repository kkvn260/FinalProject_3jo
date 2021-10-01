package com.kosta.o2controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2UserDTO;
import com.kosta.o2dto.O2WriteBoardDTO;
import com.kosta.o2service.O2UserService;


@Controller

public class UserController {


		
		@Autowired
		private O2UserService service;
		
		// �쉶�썝媛��엯
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
		public int idCheck(@RequestParam(required = false) String user_id) {
			
			return service.userIdCheck(user_id);
		}
		@RequestMapping(value = "/login" ,method = RequestMethod.GET)
		public String loginPage()  {
		
		
			return "member/login";
		}

		@RequestMapping(value = "/login", method = RequestMethod.POST )
		public String login(O2UserDTO userdto ,HttpServletRequest request,HttpSession session, Model model) throws Exception{
			
		String user_id=request.getParameter("user_id");
        String pwd=request.getParameter("pwd");
        
        O2UserDTO login=service.login(userdto);
        String path="";

		session.removeAttribute("login");
        if(login==null) {
           path="redirect:login";
        
        }else {
           session = request.getSession();
           session.setAttribute("user_id", user_id);
           session.setAttribute("pwd", pwd);
           
           request.setAttribute("login", login); //로그인성공

           path="redirect:mainpage";
        }   
        
        return path;
		}
		@GetMapping(value = "/logout")
		public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
			HttpSession session=request.getSession();
			session.invalidate(); // 세션끝
			
			return "member/logout";
		}
		@RequestMapping(value="/myinfo")
		public String myinfo(HttpServletRequest request, HttpServletResponse response,Model model) {
		
	         	HttpSession session=request.getSession();
				String user_id=(String) session.getAttribute("user_id");
	
				O2UserDTO list=service.membermdetail(user_id);
		
				model.addAttribute("list",list);
				
			return "member/myinfo";
		}
	/*
		@RequestMapping(value="/modifyresult")
		public String membermodify(@RequestParam(required = false) String user_id, @RequestParam(required = false) String nick_name 
				                  ,@RequestParam(required = false) String phoneno,@RequestParam(required = false) String email
				                  ,@RequestParam(required = false) String user_name, @RequestParam(required = false) String addr
				                  ,@RequestParam(required = false) String gender,Model model) {
		 	
			O2UserDTO list=new O2UserDTO();
			list.setUser_id(user_id);
			list.setNick_name(nick_name);
			list.setPhoneno(phoneno);
			list.setEmail(email);
			list.setUser_name(user_name);
			list.setAddr(addr);
			list.setGender(gender);
			
			int result=service.membermodify(list);
			model.addAttribute("result",result);
			model.addAttribute("user_id",user_id);
			
			return "member/modifyresult";
			
		}
	*/
}
