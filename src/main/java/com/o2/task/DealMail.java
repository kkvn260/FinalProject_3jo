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
	
	@Scheduled(cron = "0/1 * * * * *")
	public void dealresult() throws ParseException {
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<O2WriteBoardDTO> dto=service.maillist();
		if(dto!=null || dto.equals("")) {
		for(O2WriteBoardDTO list:dto) {
			Date date=new Date();
			Date listdate = sdFormat.parse(list.getWritedate());
			Double r1 = Math.floor(date.getTime()/1000);
			Double r2 = Math.floor((listdate.getTime()+172800000)/1000);
			O2DealDTO dto2=service2.dealresult(list.getTradeno());
			String getmail=service.getmail(dto2.getUser_id());
			if((r1-r2)==0.0) {
					service.dealmail(getmail,list.getTitle());					
			}
		}
		}
		
	}
}
