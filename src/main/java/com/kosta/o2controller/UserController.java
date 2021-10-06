package com.kosta.o2controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.o2dto.O2DealDTO;
import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2ReplyDTO;
import com.kosta.o2dto.O2UserDTO;
import com.kosta.o2dto.O2WriteBoardDTO;
import com.kosta.o2service.O2UserService;
import com.kosta.o2writeservice.O2WriteService;

import oracle.jdbc.proxy.annotation.GetProxy;


@Controller

public class UserController {


		@Autowired
		private O2WriteService service2;
	
		@Autowired
		private O2UserService service;
		
		// 
		@RequestMapping(value = "/registerForm")
		public String usersign() {
			
			return "member/registerForm";
		}
		@PostMapping(value = "/registersucess")
		public String usersign(O2UserDTO userdto) {
			service.signUser(userdto);
			return "member/registersucess";
		}
		@GetMapping(value = "/member/idCheck")
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
           
           request.setAttribute("login", login); 

           path="member/loginresult";
        }   
        
        return path;
		}
		
		//로그아웃
		@GetMapping(value = "/logout")
		public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
			HttpSession session=request.getSession();
			session.invalidate(); 
			
			return "member/logout";
		}
		//아이디찾기
		@RequestMapping(value = "/member/findid", method = RequestMethod.GET)
		public String findidpage() {
			return "member/findid";
		}
		@PostMapping(value = "/member/findidresult" )
		@ResponseBody
		public String findid(@RequestBody  O2UserDTO dto) {
			System.out.println("user_name!!"+dto.getUser_name());
			System.out.println("birthday!!"+dto.getBirthday());
			System.out.println("phoneno!!"+dto.getPhoneno());
			String result= service.findidcheck(dto.getUser_name(), dto.getBirthday(),dto.getPhoneno());
		 
			System.out.println("result : "+result);
			return result;
		}
		//pwd
		@RequestMapping(value = "member/findpwd", method = RequestMethod.GET)
		public String findpwdpage() {
			return "member/findpwd";
		}
		@PostMapping(value = "member/findpwdresult")
		public String findpwd(@RequestBody O2UserDTO dto) {
			System.out.println("user_id!!"+dto.getUser_id());
			System.out.println("hint!!"+dto.getHint());
			String result=service.findpwd(dto.getUser_id(),dto.getHint());
			System.out.println("result:"+result);
			return result;
		}
		

		//마이페이지
		@RequestMapping(value="/myinfo")
		public String myinfo(HttpServletRequest request, HttpServletResponse response,Model model) {
		
	         	HttpSession session=request.getSession();
				String user_id=(String) session.getAttribute("user_id");
	
				O2UserDTO list=service.membermdetail(user_id);
		
				model.addAttribute("list",list);
				
			return "member/myinfo";
		}
		//마이페이지 수정
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
		//계정삭제
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
		
		@RequestMapping(value="/myreplylist")
		public String myreplylist(HttpServletRequest request, HttpServletResponse response,Model model) {
			HttpSession session=request.getSession();
			String user_id=(String)session.getAttribute("user_id");
			
			List<O2ReplyDTO> list=service.myreplylist(user_id);
			model.addAttribute("list",list);
			
		return "member/myreplylist";
		}
	

}
