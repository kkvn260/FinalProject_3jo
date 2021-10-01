package com.kosta.o2service;

import java.sql.SQLException;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2UserDAO;
import com.kosta.o2dto.O2UserDTO;


@Service
public class O2UserService {
  
	
	@Autowired
	private O2UserDAO userdao;
	
	//�쉶�썝媛��엯
	public int signUser(O2UserDTO userdto) {
		int resultcount =0;
		
		
		try {
			resultcount = userdao.signUser(userdto);
			System.out.println("dto �솗�씤" +userdto.getUser_id()); 
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return resultcount;
	}

	// �븘�씠�뵒 以묐났 泥댄겕
	public int userIdCheck(String user_id) {
		// TODO Auto-generated method stub
		
		return userdao.checkUserId(user_id);
	}

	public O2UserDTO login(O2UserDTO userdto) throws Exception {
		// TODO Auto-generated method stub
		
		return userdao.login(userdto);
		
	}	
}