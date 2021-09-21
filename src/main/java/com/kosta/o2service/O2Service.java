package com.kosta.o2service;

import java.util.List;

import com.kosta.o2dto.O2DTO;

public interface O2Service {

	void twriteinsert(O2DTO dto);

	List<O2DTO> twritedetail(int no);
	
	public List<O2QnaBoardDTO> qnalist();
	
	
}
