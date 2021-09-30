package com.kosta.o2dao;

import java.sql.SQLException;



import org.apache.ibatis.annotations.Mapper;

import com.kosta.o2dto.O2UserDTO;

@Mapper
public interface O2UserDAO {
		

	int signUser(O2UserDTO userdto) throws SQLException;//회원가입
	// int searchPassword(String user_id, String email,String key);//회원임시 비밀번호
	// O2UserDTO loginUser(@RequestParam("user_id") String user_id); //로그인
	int checkUserId(String user_id); //아이디중복체크
	
}
