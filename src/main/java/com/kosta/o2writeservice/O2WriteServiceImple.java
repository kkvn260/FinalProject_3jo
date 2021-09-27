package com.kosta.o2writeservice;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.o2dao.O2DAO;
import com.kosta.o2dto.O2FileDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Service
public class O2WriteServiceImple implements O2WriteService {
	@Resource(name = "o2DAO")
	private O2DAO dao;

	@Override
	@Transactional
	public void twriteinsert(O2WriteBoardDTO dto, List<MultipartFile> images) {
		O2FileDTO file=new O2FileDTO();
		int no=dao.twriteinsert(dto);
		System.out.println(no);
		for(int i=0;i<images.size();i++) {		
		file.setTradeno(no);
		file.setReal_name(images.get(i).getOriginalFilename());
		file.setTemp_name(images.get(i).getName());
		dao.tinsertfile(file);
		}
	}

	@Override
	public O2WriteBoardDTO twritedetail(int no) {
		
		return dao.twritedetail(no);
	}

}
