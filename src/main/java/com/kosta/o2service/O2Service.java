package com.kosta.o2service;

import java.util.List;

import com.kosta.o2dto.O2MainBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

public interface O2Service {

	void twriteinsert(O2WriteBoardDTO dto);

	O2WriteBoardDTO twritedetail(int no);
	
	int totalCount(String search, String searchtxt);

	List<O2MainBoardDTO> searchList(String search, String searchtxt, int startRow, int endRow);	

}
