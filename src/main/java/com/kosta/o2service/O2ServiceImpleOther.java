package com.kosta.o2service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2WriteDAO;
import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Service
public class O2ServiceImpleOther implements O2ServiceOther {
	@Resource(name = "o2WriteDAO")
	private O2WriteDAO dao;


	@Override
	public List<O2WriteBoardDTO> topview() {
		// TODO Auto-generated method stub
		return dao.topviewlist();
	}


	@Override
	public List<O2QnaBoardDTO> qnalist() {
		// TODO Auto-generated method stub
		return dao.getqlist();
	}


	@Override
	public List<O2DongComDTO> dongcomlist() {
		// TODO Auto-generated method stub
		return dao.getdonglist();
	}
	
	
}
