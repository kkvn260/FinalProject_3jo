package com.kosta.o2dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.o2dto.O2UserDTO;

@Repository
public class O2UserDAOImpl implements O2UserDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean login(O2UserDTO dto) {
		String name = sqlSession.selectOne("member.login",dto);
		return (name ==null)? false : true;
	}

	@Override
	public O2UserDTO userInfo(O2UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.userInfo",dto);
	}

	@Override
	public void logout(HttpSession session) {
			
	}

	@Override
	public void registerUser(O2UserDTO dto) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	

	
}
