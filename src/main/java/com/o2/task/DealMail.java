package com.o2.task;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kosta.o2dto.O2DealDTO;
import com.kosta.o2dto.O2WriteBoardDTO;
import com.kosta.o2service.O2Service;
import com.kosta.o2writeservice.O2WriteService;


@Component
public class DealMail {
	
	@Autowired
	private O2Service service;
	
	@Autowired
	private O2WriteService service2;
	
//	Date date=new Date();
//	int month=date.getMonth()+1;
//	int day=date.getDate();
//	int hour=date.getHours();
//	int min=date.getMinutes();
//	int sec=date.getSeconds();
	
	@Scheduled(cron = "* 0/1 * * * *")
	public void dealresult() throws ParseException {
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<O2WriteBoardDTO> dto=service.maillist();
		Date date=new Date();
		System.out.println(dto.size());
		for(O2WriteBoardDTO list:dto) {
			Date listdate = sdFormat.parse(list.getWritedate());
			long r1 = date.getTime();
			long r2=listdate.getTime();
			O2DealDTO dto2=service2.dealresult(list.getTradeno());
			System.out.println(dto2.getUser_id());
			if(r1==r2) {
				 
			}else {
				System.out.println("다름");
			}
		}
		
	}
}
