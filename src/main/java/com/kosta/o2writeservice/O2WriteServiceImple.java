package com.kosta.o2writeservice;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.o2dao.O2WriteDAO;
import com.kosta.o2dto.O2FileDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Service
public class O2WriteServiceImple implements O2WriteService {
	
	@Autowired
	private O2WriteDAO dao;
	
	@Override
	@Transactional
	public void twriteinsert(O2WriteBoardDTO dto, List<MultipartFile> images) {
		dao.twriteinsert(dto);
		int no=dto.getTradeno();
		System.out.println("no : "+dto.getTradeno());
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat dateform=new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time=dateform.format(cal.getTime());
		
		for(int i=0;i<images.size();i++) {		
			O2FileDTO file=new O2FileDTO();
		file.setTradeno(no);
		file.setReal_name(images.get(i).getOriginalFilename());
		file.setTemp_name(i+time);
		
		dao.tinsertfile(file);
		}
	}

	@Override
	public O2WriteBoardDTO twritedetail(int no) {
		
		return dao.twritedetail(no);
	}

}
