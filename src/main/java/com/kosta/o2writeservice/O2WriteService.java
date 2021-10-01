package com.kosta.o2writeservice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kosta.o2dto.O2DealDTO;
import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2FileDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

public interface O2WriteService {

	public void twriteinsert(O2WriteBoardDTO dto, List<MultipartFile> images);

	public O2WriteBoardDTO twritedetail(int no);

	public List<O2WriteBoardDTO> selllist();

	public List<O2WriteBoardDTO> deallist();

	public List<O2FileDTO> tfiledetail(int no);

	public void twritedelete(int no);

	public void twritemodifyresult(O2WriteBoardDTO dto, List<MultipartFile> images);

	public void dwriteinsert(O2DongComDTO dto, List<MultipartFile> images);

	public O2DongComDTO dwritedetail(int no);

	public List<O2FileDTO> dfiledetail(int no);

	public void dwritedelete(int no);

	public void dwritemodifyresult(O2DongComDTO dto, List<MultipartFile> images);

	public void qwriteinsert(O2QnaBoardDTO dto, List<MultipartFile> images);

	public O2QnaBoardDTO qwritedetail(int no);

	public List<O2FileDTO> qfiledetail(int no);

	public void qwritedelete(int no);

	public void qwritemodifyresult(O2QnaBoardDTO dto, List<MultipartFile> images);

	public void dealinsert(O2DealDTO dto);

	public String getprice(int tradeno);

}
