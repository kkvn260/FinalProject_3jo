package com.kosta.o2dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2FileDTO;
import com.kosta.o2dto.O2MainBoardDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Mapper
public interface O2WriteDAO {


	void twriteinsert(O2WriteBoardDTO dto);

	O2WriteBoardDTO twritedetail(int no); 

	List<O2WriteBoardDTO> topviewlist();

	List<O2QnaBoardDTO> getqlist();

	int totalCount(HashMap<String, Object> hm);

	List<O2MainBoardDTO> getmlist(HashMap<String, Object> hm);

	void tinsertfile(O2FileDTO file);

	List<O2WriteBoardDTO> selllist();

	List<O2DongComDTO> getdonglist();

	List<O2WriteBoardDTO> deallist();

	List<O2FileDTO> tfiledetail(int no);

	void twritedelete(int no);

	void twritemodifyresult(O2WriteBoardDTO dto);

	void tfiledelete(int no);	
	
	
}
