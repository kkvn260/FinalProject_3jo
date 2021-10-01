package com.kosta.o2dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.o2dto.O2UserDTO;

@Mapper
public interface O2UserDAO {
		

	int signUser(O2UserDTO userdto) throws SQLException;//�쉶�썝媛��엯
	// int searchPassword(String user_id, String email,String key);//�쉶�썝�엫�떆 鍮꾨�踰덊샇
	O2UserDTO login(O2UserDTO userdto) throws Exception;
	int checkUserId(String user_id); //�븘�씠�뵒以묐났泥댄겕
	//int membermodify(O2UserDTO list);
	O2UserDTO memberdetail(String user_id);
	
}
