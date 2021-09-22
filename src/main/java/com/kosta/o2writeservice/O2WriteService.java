package com.kosta.o2writeservice;

import java.util.List;

import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

public interface O2WriteService {

	void twriteinsert(O2WriteBoardDTO dto);

	List<O2WriteBoardDTO> twritedetail(int no);
	
	public List<O2QnaBoardDTO> qnalist();
}
