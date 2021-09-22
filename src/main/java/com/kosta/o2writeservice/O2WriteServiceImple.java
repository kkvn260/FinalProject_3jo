package com.kosta.o2writeservice;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2DAO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Service
public class O2WriteServiceImple implements O2WriteService {
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
	public List<O2QnaBoardDTO> qnalist(){
		return dao.getlist();

	}
	
	
}
