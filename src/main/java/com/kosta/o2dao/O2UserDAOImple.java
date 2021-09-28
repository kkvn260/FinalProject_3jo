package com.kosta.o2dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.o2dto.O2UserDTO;

@Repository
public class O2UserDAOImple implements O2UserDAO {
	
	
	String NAMESPACE="com.kosta.o2dao.O2UserDAO";
	@Inject
	SqlSession session;
	
	@Override
	public boolean loginCheck(O2UserDTO dto) {
		// TODO Auto-generated method stub
		String name= session.selectOne(NAMESPACE+".loginCheck",dto);
		return (name == null) ? false : true;
	}

	

	@Override
	public O2UserDTO userInfo(O2UserDTO dto) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".userInfo",dto);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	
}
