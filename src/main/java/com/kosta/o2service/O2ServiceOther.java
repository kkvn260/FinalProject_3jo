package com.kosta.o2service;

import java.util.List;

import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

public interface O2ServiceOther {
	

	public List<O2WriteBoardDTO> topview();

	public List<O2QnaBoardDTO> qnalist();

	public List<O2DongComDTO> dongcomlist();

	public List<O2DongComDTO> dongtopview();

	public void removeSearchData();



	
}
