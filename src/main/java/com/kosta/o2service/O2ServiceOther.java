package com.kosta.o2service;

import java.util.List;

import com.kosta.o2dto.O2QnaBoardDTO;

public interface O2ServiceOther {
	
	public List<O2QnaBoardDTO> qnalist();
	
	int qnainsert(O2QnaBoardDTO dto);
	
}
