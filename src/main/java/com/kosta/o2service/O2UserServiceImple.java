package com.kosta.o2service;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2UserDAO;
import com.kosta.o2dto.O2UserDTO;

@Service
public class O2UserServiceImple implements O2UserService {

	@Autowired
	private O2UserDAO dao;
	 
	@Override
	public boolean loginCheck(O2UserDTO dto, HttpSession session) {
		String result = dao.loginCheck(dto);
		boolean checkId = (result !=null)? true : false;
		
		if(checkId) {
			O2UserDTO user = userInfo(dto);
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("nick_name", user.getNick_name());
		}
		
		return checkId;
	}

	@Override
	public O2UserDTO userInfo(O2UserDTO dto) {
		return dao.userInfo(dto);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
		
	}

	@Override
	public void registerUser(O2UserDTO dto) {
		dao.registerUser(dto);
	}
	
} 
