package com.kosta.o2service;

import javax.servlet.http.HttpSession;

import com.kosta.o2dto.O2UserDTO;

public interface O2UserService {
  
	boolean loginCheck(O2UserDTO dto, HttpSession session);
	
	O2UserDTO userInfo(O2UserDTO dto);
	
	void logout(HttpSession session);

	void registerUser(O2UserDTO dto); 
	
}
