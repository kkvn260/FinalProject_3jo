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
import com.kosta.o2dto.O2DongComDTO;
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
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat dateform=new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time=dateform.format(cal.getTime());
		
		if(!images.get(0).getOriginalFilename().equals("")) {
			for(int i=0;i<images.size();i++) {		
				O2FileDTO file=new O2FileDTO();
				file.setTradeno(no);
				file.setReal_name(images.get(i).getOriginalFilename());
				file.setTemp_name(i+time);

				dao.tinsertfile(file);
			}
		}
	}

	@Override
	public O2WriteBoardDTO twritedetail(int no) {
		
		return dao.twritedetail(no);
	}

	@Override
	public List<O2WriteBoardDTO> selllist() {
		
		return dao.selllist();
	}

	@Override
	public List<O2WriteBoardDTO> deallist() {
		// TODO Auto-generated method stub
		return dao.deallist();
	}

	@Override
	public List<O2FileDTO> tfiledetail(int no) {
		// TODO Auto-generated method stub
		return dao.tfiledetail(no);
	}

	@Override
	public void twritedelete(int no) {
		dao.twritedelete(no);
		
	}

	@Override
	@Transactional
	public void twritemodifyresult(O2WriteBoardDTO dto,List<MultipartFile> images) {
		// TODO Auto-generated method stub
		int no=dto.getTradeno();
		dao.twritemodifyresult(dto);
//		System.out.println(no);
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat dateform=new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time=dateform.format(cal.getTime());
		
		
		if(!images.get(0).getOriginalFilename().equals("")) {
			dao.tfiledelete(no);
			
			for(int i=0;i<images.size();i++) {		
				O2FileDTO file=new O2FileDTO();
				file.setTradeno(no);
				file.setReal_name(images.get(i).getOriginalFilename());
				file.setTemp_name(i+time);

				dao.tinsertfile(file);
			}
		}
		
	}

	@Override
	public void dwriteinsert(O2DongComDTO dto, List<MultipartFile> images) {
		// TODO Auto-generated method stub
		dao.dwriteinsert(dto);
		int no=dto.getChatno();
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat dateform=new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time=dateform.format(cal.getTime());
		
		if(!images.get(0).getOriginalFilename().equals("")) {
			for(int i=0;i<images.size();i++) {		
				O2FileDTO file=new O2FileDTO();
				file.setTradeno(no);
				file.setReal_name(images.get(i).getOriginalFilename());
				file.setTemp_name(i+time);

				dao.dinsertfile(file);
			}
		}
	}

}
