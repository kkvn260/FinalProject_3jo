package com.kosta.o2writeservice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

public interface O2WriteService {

	public void twriteinsert(O2WriteBoardDTO dto, List<MultipartFile> images);

	public O2WriteBoardDTO twritedetail(int no);

}
