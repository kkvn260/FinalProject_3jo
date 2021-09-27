package com.kosta.o2dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.o2dto.O2UserDTO;

@Mapper
public interface O2UserDAO {

	public boolean login(O2UserDTO dto);
		
	public O2UserDTO userInfo(O2UserDTO dto);
   
	public void logout(HttpSession session);
	
}
