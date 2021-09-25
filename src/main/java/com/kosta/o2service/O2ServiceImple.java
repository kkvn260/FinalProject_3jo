package com.kosta.o2service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2DAO;
import com.kosta.o2dto.O2MainBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Service
public class O2ServiceImple implements O2Service {
	@Resource(name = "o2DAO")
	private O2DAO dao;

	@Override
	public void twriteinsert(O2WriteBoardDTO dto) {

		dao.twriteinsert(dto);
	}

	@Override
	public O2WriteBoardDTO twritedetail(int no) {
		
		return dao.twritedetail(no);
	}

	@Override
	public int totalCount(String search, String searchtxt) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		int result = dao.totalCount(hm);
		return result;
	}


	@Override
	public List<O2MainBoardDTO> searchList(String search, String searchtxt, int startRow, int endRow) 
	{
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		return dao.getmlist(hm);
	}

	
	
	
}
