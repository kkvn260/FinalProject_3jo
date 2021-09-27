package com.kosta.o2service;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2UserDAO;
import com.kosta.o2dto.O2UserDTO;

@Service
public class O2UserServiceImple implements O2UserService {

	@Resource(name = "o2UserDAO")
	private O2UserDAO dao;
	
	@Override
	public boolean login(O2UserDTO dto, HttpSession session) {
		boolean result = dao.login(dto);
		if(result) {
			O2UserDTO user = userInfo(dto);
			session.setAttribute("userId", user.getUser_id());
			session.setAttribute("userPwd", user.getPwd());
		}
		
		return result;
	}

	@Override
	public O2UserDTO userInfo(O2UserDTO dto) {
		return dao.userInfo(dto);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
		
	}

	
} 
