package com.kosta.o2controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.o2dto.O2DealDTO;
import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2UserDTO;
import com.kosta.o2dto.O2WriteBoardDTO;
import com.kosta.o2service.O2UserService;
import com.kosta.o2writeservice.O2WriteService;


@Controller

public class UserController {


		@Autowired
		private O2WriteService service2;
	
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

		//로그인
		@RequestMapping(value = "/login", method = RequestMethod.POST )
		public String login(O2UserDTO userdto ,HttpServletRequest request,HttpSession session, Model model) throws Exception{
			
		String user_id=request.getParameter("user_id");
        String pwd=request.getParameter("pwd");
        
        O2UserDTO login=service.login(userdto);
        String path="";

		session.removeAttribute("login");
        if(login==null) {
           path="member/loginresult";
        
        }else {
           session = request.getSession();
           session.setAttribute("user_id", user_id);
           session.setAttribute("pwd", pwd);
           
           request.setAttribute("login", login); //로그인성공

           path="member/loginresult";
        }   
        
        return path;
		}
		
		//로그아웃
		@GetMapping(value = "/logout")
		public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
			HttpSession session=request.getSession();
			session.invalidate(); // 세션끝
			
			return "member/logout";
		}
		// 디테일정보
		@RequestMapping(value="/myinfo")
		public String myinfo(HttpServletRequest request, HttpServletResponse response,Model model) {
		
	         	HttpSession session=request.getSession();
				String user_id=(String) session.getAttribute("user_id");
	
				O2UserDTO list=service.membermdetail(user_id);
		
				model.addAttribute("list",list);
				
			return "member/myinfo";
		}
		//회원정보수정
		@RequestMapping(value = "/modify/{user_Id}")
		public String modify(HttpServletRequest request,String user_id, Model model) {
			HttpSession session=request.getSession();
			user_id=(String) session.getAttribute("user_id");
			
			O2UserDTO list = service.modify(user_id);
			model.addAttribute("list", list);
			return "member/modify";
		}
		@RequestMapping(value = "/modifyresult")
		public String modifyresult(O2UserDTO list) {
				service.modifyresult(list);
				
				return "member/modifyresult";			
		}
		//회원탈퇴
		@RequestMapping(value="/delete")
		public String delete(HttpServletRequest request,Model model) {
			HttpSession session=request.getSession();
			String user_id=(String) session.getAttribute("user_id");
			
			service2.dealdelete(user_id);
			int result=service.delete(user_id);
			model.addAttribute("result",result);
			session.invalidate();
		    
			return "member/delete";

		}
		
		@RequestMapping(value="/deleteresult")
		public String deleteresult() {
			return "member/deleteresult";
		}
		
		//내가 쓴 글
		@RequestMapping(value="/mysboardlist")
		public String mysboardlist(HttpServletRequest request, HttpServletResponse response,Model model) {
         	HttpSession session=request.getSession();
			String user_id=(String) session.getAttribute("user_id");

			List<O2WriteBoardDTO> list=service.mysboardlist(user_id);
	
			model.addAttribute("list",list);
			
		return "member/mysboardlist";
		}
		
		@RequestMapping(value="/mydboardlist")
		public String mydboardlist(HttpServletRequest request, HttpServletResponse response,Model model) {
			HttpSession session=request.getSession();
			String user_id=(String) session.getAttribute("user_id");

			List<O2WriteBoardDTO> list=service.mydboardlist(user_id);
	
			model.addAttribute("list",list);
			
		return "member/mydboardlist";
		}
		
		@RequestMapping(value="/mydongboardlist")
		public String mydongboardlist(HttpServletRequest request, HttpServletResponse response,Model model) {
         	HttpSession session=request.getSession();
			String user_id=(String) session.getAttribute("user_id");

			List<O2DongComDTO> list=service.mydongboardlist(user_id);
	
			model.addAttribute("list",list);
			
		return "member/mydongboardlist";
		}
		
		@RequestMapping(value="/myqnaboardlist")
		public String myqnaboardlist(HttpServletRequest request, HttpServletResponse response,Model model) {
         	HttpSession session=request.getSession();
			String user_id=(String) session.getAttribute("user_id");

			List<O2QnaBoardDTO> list=service.myqnaboardlist(user_id);
	
			model.addAttribute("list",list);
			
		return "member/myqnaboardlist";
		}
	

}
