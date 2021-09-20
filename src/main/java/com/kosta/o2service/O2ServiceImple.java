package com.kosta.o2service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2DAO;
import com.kosta.o2dto.O2DTO;

@Service
public class O2ServiceImple implements O2Service {
	@Resource(name = "o2DAO")
	private O2DAO dao;

	@Override
	public void twriteinsert(O2DTO dto) {
		// TODO Auto-generated method stub
		dao.twriteinsert(dto);
	}

	@Override
	public List<O2DTO> twritedetail(int no) {
		
		return dao.twritedetail(no);
	}
	
	
}
