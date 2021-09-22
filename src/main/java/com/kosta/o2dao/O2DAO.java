package com.kosta.o2dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Mapper
public interface O2DAO {


	void twriteinsert(O2WriteBoardDTO dto);

	O2WriteBoardDTO twritedetail(int no); 
	
	public List<O2QnaBoardDTO> getlist();

	public int qnainsert(O2QnaBoardDTO dto);
	


}
