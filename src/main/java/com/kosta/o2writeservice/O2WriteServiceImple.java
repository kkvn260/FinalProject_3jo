package com.kosta.o2writeservice;

import java.lang.annotation.Target;
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
import com.kosta.o2dto.O2DealDTO;
import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2FileDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2ReplyDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Service
public class O2WriteServiceImple implements O2WriteService {
	
	@Autowired
	private O2WriteDAO dao;
	
	@Override
	@Transactional
	public void twriteinsert(O2WriteBoardDTO dto, List<MultipartFile> images) {
		dao.twriteinsert(dto);
		if(!dto.getDeal_price().equals("")) {
			dao.dealinsert2(dto);
		}
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
	@Transactional
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
				file.setChatno(no);
				file.setReal_name(images.get(i).getOriginalFilename());
				file.setTemp_name(i+time);

				dao.dinsertfile(file);
			}
		}
	}

	@Override
	public O2DongComDTO dwritedetail(int no) {
		// TODO Auto-generated method stub
		return dao.dwritedetail(no);
	}

	@Override
	public List<O2FileDTO> dfiledetail(int no) {
		// TODO Auto-generated method stub
		return dao.dfiledetail(no);
	}

	@Override
	public void dwritedelete(int no) {
		// TODO Auto-generated method stub
		dao.dwritedelete(no);
		
	}

	@Override
	@Transactional
	public void dwritemodifyresult(O2DongComDTO dto,List<MultipartFile> images) {
		// TODO Auto-generated method stub
		int no=dto.getChatno();
		dao.dwritemodifyresult(dto);
		
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat dateform=new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time=dateform.format(cal.getTime());


		if(!images.get(0).getOriginalFilename().equals("")) {
			dao.dfiledelete(no);

			for(int i=0;i<images.size();i++) {		
				O2FileDTO file=new O2FileDTO();
				file.setChatno(no);
				file.setReal_name(images.get(i).getOriginalFilename());
				file.setTemp_name(i+time);

				dao.dinsertfile(file);
			}
		}

	}

	@Override
	@Transactional
	public void qwriteinsert(O2QnaBoardDTO dto, List<MultipartFile> images) {
		dao.qwriteinsert(dto);
		int no=dto.getQnano();
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat dateform=new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time=dateform.format(cal.getTime());
		
		if(!images.get(0).getOriginalFilename().equals("")) {
			for(int i=0;i<images.size();i++) {		
				O2FileDTO file=new O2FileDTO();
				file.setQnano(no);
				file.setReal_name(images.get(i).getOriginalFilename());
				file.setTemp_name(i+time);

				dao.qinsertfile(file);
			}
		}
	}

	@Override
	public O2QnaBoardDTO qwritedetail(int no) {
		// TODO Auto-generated method stub
		return dao.qwritedetail(no);
	}

	@Override
	public List<O2FileDTO> qfiledetail(int no) {
		// TODO Auto-generated method stub
		return dao.qfiledetail(no);
	}

	@Override
	public void qwritedelete(int no) {
		// TODO Auto-generated method stub
		dao.qwritedelete(no);
	}

	@Override
	@Transactional
	public void qwritemodifyresult(O2QnaBoardDTO dto, List<MultipartFile> images) {
		// TODO Auto-generated method stub
		int no=dto.getQnano();
		dao.qwritemodifyresult(dto);
		
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat dateform=new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time=dateform.format(cal.getTime());


		if(!images.get(0).getOriginalFilename().equals("")) {
			dao.qfiledelete(no);

			for(int i=0;i<images.size();i++) {		
				O2FileDTO file=new O2FileDTO();
				file.setQnano(no);
				file.setReal_name(images.get(i).getOriginalFilename());
				file.setTemp_name(i+time);

				dao.qinsertfile(file);
			}
		}

	}

	@Override
	public void dealinsert(O2DealDTO dto) {
		// TODO Auto-generated method stub
		dao.dealinsert(dto);
	}

	@Override
	public String getprice(int tradeno) {
		// TODO Auto-generated method stub
		return dao.getprice(tradeno);
	}

	@Override
	public List<O2ReplyDTO> treplydetail(int no) {
		// TODO Auto-generated method stub
		return dao.treplydetail(no);
	}

	@Override
	public void treplyinsert(O2ReplyDTO dto) {
		// TODO Auto-generated method stub
		dao.treplyinsert(dto);
	}

	@Override
	public O2ReplyDTO treplychild(O2ReplyDTO dto) {
		// TODO Auto-generated method stub
		return dao.treplychild(dto);
	}

	@Override
	public void treplychildinsert(O2ReplyDTO dto) {
		// TODO Auto-generated method stub
		dao.treplychildinsert(dto);
	}

}
