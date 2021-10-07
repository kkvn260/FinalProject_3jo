package com.kosta.o2service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2WriteDAO;
import com.kosta.o2dto.O2MainBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Service
public class O2ServiceImple implements O2Service {
	@Resource(name = "o2WriteDAO")
	private O2WriteDAO dao;

	@Override
	public void twriteinsert(O2WriteBoardDTO dto) {

		dao.twriteinsert(dto);
	}

	@Override
	public O2WriteBoardDTO twritedetail(int no) {
		
		return dao.twritedetail(no);
	}

	@Override
	public int sellCount(String search, String searchtxt) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		int result = dao.sellCount(hm);
		return result;
	}

	@Override
	public List<O2MainBoardDTO> sellList(String search, String searchtxt, int startRow, int pageSize) {
			
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("search", search);
			hm.put("searchtxt", searchtxt);
			hm.put("startRow", startRow);
			hm.put("pageSize", pageSize);
					
			return dao.sellList(hm);
	}

	@Override
	public int dealCount(String search, String searchtxt) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return dao.dealCount(hm);
		
	}

	@Override
	public List<O2MainBoardDTO> dealList(String search, String searchtxt, int startRow, int pageSize) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
				
		return dao.dealList(hm);
	}
	
	@Override
	public void searchSellData(String search, String searchtxt) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);

		//검색글에서 카테고리 출력
	    List<String> category = dao.searchSellCount(hm);
	    
	    //db에 카테고리 추가
	    if(category.isEmpty() == false)
	    	dao.addSearchData(category);
	}

	@Override
	public void searchDealData(String search, String searchtxt) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);

		//검색글에서 카테고리 출력
	    List<String> category = dao.searchDealCount(hm);
	    
	    //db에 카테고리 추가
	    if(category.isEmpty() == false)
	    	dao.addSearchData(category);
				
	}

	
}
