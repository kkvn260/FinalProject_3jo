package com.kosta.o2dao;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.o2dto.O2DTO;

@Mapper
public interface O2DAO {

	void writeinsert(O2DTO dto);

}
