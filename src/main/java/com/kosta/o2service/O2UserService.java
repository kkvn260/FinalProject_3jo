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
	private SqlSessionTemplate sqlSession;
	private O2UserDAO userdao;
	
	//회원가입
	public int signUser(O2UserDTO userdto) {
		int resultcount =0;
		
		userdao= sqlSession.getMapper(O2UserDAO.class);
		try {
			resultcount = userdao.signUser(userdto);
			System.out.println("dto 확인" +userdto.getUser_id()); 
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return resultcount;
	}

	// 아이디 중복 체크
	public int userIdCheck(String user_id) {
		// TODO Auto-generated method stub
		userdao = sqlSession.getMapper(O2UserDAO.class);
		return userdao.checkUserId(user_id);
	}
	
}
