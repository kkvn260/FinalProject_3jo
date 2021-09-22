package com.kosta.o2service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2DAO;
import com.kosta.o2dto.O2QnaBoardDTO;

@Service
public class O2ServiceImpleOther implements O2ServiceOther {
	@Resource(name = "o2DAO")
	private O2DAO dao;


	@Override
	public List<O2QnaBoardDTO> qnalist() {
		// TODO Auto-generated method stub
		return dao.getlist();
	
	}


	@Override
	public int qnainsert(O2QnaBoardDTO dto) {
		// TODO Auto-generated method stub
		
		int result=dao.qnainsert(dto);
		
		return result;
	}
	
	
}
