package com.kosta.o2service;

import javax.annotation.Resource;
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
	public boolean login(O2UserDTO dto, HttpSession session) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public O2UserDTO UserInfo(O2UserDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	
} 
