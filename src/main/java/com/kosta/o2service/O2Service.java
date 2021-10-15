package com.kosta.o2service;

import java.util.HashMap;
import java.util.List;

import com.kosta.o2dto.O2MainBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

public interface O2Service {

	void twriteinsert(O2WriteBoardDTO dto);

	O2WriteBoardDTO twritedetail(int no);
	
	int sellCount(String search, String searchtxt);

	List<O2MainBoardDTO> sellList(String search, String searchtxt, int startRow, int pageSize);

	int dealCount(String search, String searchtxt);

	List<O2MainBoardDTO> dealList(String search, String searchtxt, int startRow, int pageSize);	
		
	void searchSellData(String search, String searchtxt);

	void searchDealData(String search, String searchtxt);

	List<String> getTopSearch();

	List<O2WriteBoardDTO> maillist();

	String getmail(String user_id);

	void dealmail(String getmail, String title);

	void dealmail2(String getmail, String title);


}
