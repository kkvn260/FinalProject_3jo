package com.kosta.o2controller;



import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;

import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2LikeDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2ReplyDTO;
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
		
		// 
		@RequestMapping(value = "/registerForm")
		public String usersign() {
			
			return "member/registerForm";
		}
		@PostMapping(value = "/registersuccess")
		public String usersign(O2UserDTO userdto) {
			service.signUser(userdto);
			return "member/registersuccess";
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
			
			String result= service.findidcheck(dto.getUser_name(), dto.getBirthday(),dto.getPhoneno());
		 
			return result;
		}
		//pwd
		
		@GetMapping(value = "/findpwd")
		public String findpwdpage() {
			return "member/findpwd";
		}
		@PostMapping(value = "/findpwd")
		public String findpwdSend(HttpSession session,@RequestParam (required=false)String email,RedirectAttributes ra) {
			O2UserDTO member = service.findAccount(email);
			String path="";
			if(member ==null) {
				ra.addFlashAttribute("resultMsg","입력하신 이메일로 가입된 정보가 없습니다.");
				path= "member/findpwd";
			}else {
			
			int ran = new Random().nextInt(100000)+10000;
			String pwd=  String.valueOf(ran);
			
			service.findpwdupdate(email,pwd);
			String subject = "임시 비밀번호 발급 안내입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 임시 비밀번호는"+pwd+"입니다.");
			service.send(subject, sb.toString(), "02o252@naver.com",email, null);
			ra.addFlashAttribute("resultMsg","귀하의 이메일 주소로 새로운 임시 비밀번호를 발송하였습니다.");
		
		path= "member/findpwdresult";
			
		}
			return path;
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
		
		@RequestMapping(value="/mylikelist")
		public String mylikelist(HttpServletRequest request, HttpServletResponse response,Model model) {
			HttpSession session=request.getSession();
			String user_id=(String)session.getAttribute("user_id");
			
			List<O2LikeDTO> list=service.mylikelist(user_id);
			model.addAttribute("list",list);
		return "member/mylikelist";
		}
		
       private NaverLoginBO naverLoginBO;
       private String apiResult = null;
       
       @Autowired 
       private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
    	   this.naverLoginBO = naverLoginBO; 
    	   }
       
       @RequestMapping(value = "/naverlogin", method = { RequestMethod.GET, RequestMethod.POST }) 
       public String naverlogin(Model model, HttpSession session) { 

    	   String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session); 
    	   model.addAttribute("url", naverAuthUrl); 
    	   return "member/naverlogin"; 
    	   } 
  
       @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
       public String insertnaver(HttpServletRequest request,O2UserDTO userdto,HttpSession session, Model model,@RequestParam String code, @RequestParam String state)throws IOException, ParseException  {
    	 
    	   
    	   OAuth2AccessToken oauthToken;
    	   oauthToken = naverLoginBO.getAccessToken(session, code, state); 
    	   apiResult = naverLoginBO.getUserProfile(oauthToken); 
    	   JSONParser parser = new JSONParser(); 
    	   Object obj = parser.parse(apiResult);
    	   
    	   JSONObject jsonObj = (JSONObject) obj; 
    	   
    	   JSONObject response_obj = (JSONObject)jsonObj.get("response"); 
    	   
    	   String email=(String) response_obj.get("email");
    	   String user_id=email.substring(0,email.indexOf("@"));
    	   String user_name=(String)response_obj.get("name");
    	   String gender=(String)response_obj.get("gender");
    	   String phoneno=(String)response_obj.get("mobile");
    	   String birthday=(String)response_obj.get("birthday");
    
    	   session=request.getSession();
    	   session.setAttribute("user_id", user_id);
    	
           userdto.setUser_id(user_id);
           userdto.setGender(gender);
           userdto.setPhoneno(phoneno);
           userdto.setUser_name(user_name);
           userdto.setEmail(email);
           userdto.setBirthday(birthday);
           int result= service.userIdCheck(user_id);
         
           if(result==0) {
              service.insertnaver(userdto);
           }
    	   model.addAttribute("result", apiResult);
    	   model.addAttribute("id",user_id);
    	   int addrcheck=service.addrcheck(user_id);
    	   if(addrcheck==1) {
    		   model.addAttribute("login",user_id);
    		   return "member/loginresult";
    	   }
    	   return "member/naverloginresult";
    	
       }
       @RequestMapping("modiaddr")
       public String modiaddr(O2UserDTO dto) {
    	   	service.modiaddr(dto);
    	   return "redirect:mainpage";
       }
       

}
