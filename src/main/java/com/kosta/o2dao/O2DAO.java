package com.kosta.o2dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.o2dto.O2DTO;

@Mapper
public interface O2DAO {

	void twriteinsert(O2DTO dto);

	List<O2DTO> twritedetail(int no);
	
	public List<O2QnaBoardDTO> getlist();

}
