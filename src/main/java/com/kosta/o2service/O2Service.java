package com.kosta.o2service;

import java.util.List;



import com.kosta.o2dto.O2WriteBoardDTO;

public interface O2Service {

	void twriteinsert(O2WriteBoardDTO dto);

	O2WriteBoardDTO twritedetail(int no);

}
