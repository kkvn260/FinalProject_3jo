package com.kosta.o2dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.o2dto.O2MainBoardDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Mapper
public interface O2DAO {


	void twriteinsert(O2WriteBoardDTO dto);

	O2WriteBoardDTO twritedetail(int no); 

	List<O2WriteBoardDTO> topviewlist();

	List<O2QnaBoardDTO> getlist();

	int totalCount(HashMap<String, Object> hm);

	List<O2MainBoardDTO> getlist(HashMap<String, Object> hm);	
	
	
}
