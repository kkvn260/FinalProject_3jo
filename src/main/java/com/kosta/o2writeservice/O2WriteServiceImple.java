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
		dao.twritecount(no);
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
		dao.dwritecount(no);
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
		dao.qwritecount(no);
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
		dao.treplyupdate(dto);
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

	@Override
	public List<O2ReplyDTO> dreplydetail(int no) {
		// TODO Auto-generated method stub
		return dao.dreplydetail(no);
	}

	@Override
	public List<O2ReplyDTO> qreplydetail(int no) {
		// TODO Auto-generated method stub
		return dao.qreplydetail(no);
	}

	@Override
	public void dreplyinsert(O2ReplyDTO dto) {
		dao.dreplyinsert(dto);
		dao.dreplyupdate(dto);
		
	}

	@Override
	public O2ReplyDTO dreplychild(O2ReplyDTO dto) {
		// TODO Auto-generated method stub
		return dao.dreplychild(dto);
	}

	@Override
	public void dreplychildinsert(O2ReplyDTO dto) {
		// TODO Auto-generated method stub
		dao.dreplychildinsert(dto);
	}

	@Override
	public void qreplyinsert(O2ReplyDTO dto) {
		dao.qreplyinsert(dto);
		dao.qreplyupdate(dto);
		
	}

	@Override
	public O2ReplyDTO qreplychild(O2ReplyDTO dto) {
		// TODO Auto-generated method stub
		return dao.qreplychild(dto);
	}

	@Override
	public void qreplychildinsert(O2ReplyDTO dto) {
		// TODO Auto-generated method stub
		dao.qreplychildinsert(dto);
	}

	@Override
	public void dealdelete(String user_id) {
		// TODO Auto-generated method stub
		dao.dealdelete(user_id);
	}

	@Override
	public void treplydelete(int no) {
		// TODO Auto-generated method stub
		dao.treplydelete(no);
	}

	@Override
	public void dreplydelete(int no) {
		// TODO Auto-generated method stub
		dao.dreplydelete(no);
	}

	@Override
	public void qreplydelete(int no) {
		// TODO Auto-generated method stub
		dao.qreplydelete(no);
	}

	@Override
	public void treplydelete2(int no) {
		// TODO Auto-generated method stub
		dao.treplydelete2(no);
	}

	@Override
	public void dreplydelete2(int no) {
		// TODO Auto-generated method stub
		dao.dreplydelete2(no);
	}

	@Override
	public void qreplydelete2(int no) {
		// TODO Auto-generated method stub
		dao.qreplydelete2(no);
	}

}
