package com.kosta.o2service;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2UserDAO;
import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2LikeDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2ReplyDTO;
import com.kosta.o2dto.O2UserDTO;
import com.kosta.o2dto.O2WriteBoardDTO;
import com.mchange.net.MailSender;


@Service
public class O2UserService {
  
	
	@Autowired
	private O2UserDAO userdao;
	//mail
	@Autowired
	private JavaMailSender javamailSender;
	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javamailSender = javaMailSender;
	}
	public boolean send(String subject,String text, String from,String to, String filePath) {
		MimeMessage message = javamailSender.createMimeMessage();
		try
		{
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setSubject(subject);
			helper.setText(text,true);
			helper.setFrom(from);
			helper.setTo(to);
			
			if(filePath !=null) {
				File file =new File(filePath);
				if(file.exists()) {
					helper.addAttachment(file.getName(), new File(filePath));
					
				}
			}
			javamailSender.send(message);
			return true;
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}
	//�쉶�썝媛��엯
	public int signUser(O2UserDTO userdto) {
		int resultcount =0;
		
		
		try {
			resultcount = userdao.signUser(userdto);
			 
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return resultcount;
	}

	// �븘�씠�뵒 以묐났 泥댄겕
	public int userIdCheck(String user_id) {
		// TODO Auto-generated method stub
		
		return userdao.checkUserId(user_id);
	}

	public O2UserDTO login(O2UserDTO userdto) throws Exception {
		// TODO Auto-generated method stub
		
		return userdao.login(userdto);
		
	}
	public String findidcheck(String user_name, String birthday ,String phoneno) {
		// TODO Auto-generated method stub
		
		
		HashMap<String, String> hm=new HashMap<String, String>();
		hm.put("user_name", user_name);
		hm.put("birthday", birthday);
		hm.put("phoneno", phoneno);
		return userdao.findidcheck(hm);
		
	}
	
	public O2UserDTO membermdetail(String user_id) {
		// TODO Auto-generated method stub
		return userdao.memberdetail(user_id);
	}

	public O2UserDTO modify(String user_id) {
		// TODO Auto-generated method stub
		return userdao.memberdetail(user_id);
	}

	public void modifyresult(O2UserDTO list) {
		// TODO Auto-generated method stub
		userdao.modifyresult(list);
	}

	public int delete(String user_id) {
		// TODO Auto-generated method stub
		return userdao.delete(user_id);
	}

	public List<O2WriteBoardDTO> mysboardlist(String user_id) {
		// TODO Auto-generated method stub
		return userdao.mysboardlist(user_id);
	}

	public List<O2WriteBoardDTO> mydboardlist(String user_id) {
		// TODO Auto-generated method stub
		return userdao.mydboardlist(user_id);
	}

	public List<O2DongComDTO> mydongboardlist(String user_id) {
		// TODO Auto-generated method stub
		return userdao.mydongboardlist(user_id);
	}

	public List<O2QnaBoardDTO> myqnaboardlist(String user_id) {
		// TODO Auto-generated method stub
		return userdao.myqnaboardlist(user_id);
	}

	public List<O2ReplyDTO> myreplylist(String user_id) {
		// TODO Auto-generated method stub
		return userdao.myreplylist(user_id);
	}

	public void insertnaver(O2UserDTO userdto) {
		// TODO Auto-generated method stub
		userdao.insertnaver(userdto);
	}

	public void modiaddr(O2UserDTO dto) {
		// TODO Auto-generated method stub
		userdao.modiaddr(dto);
	}

	public int addrcheck(String user_id) {
		// TODO Auto-generated method stub
		String check=userdao.addrcheck(user_id);
		int result=0;
		if(!check.equals("0")) {
			result=1;
		}
		return result;
	}

	
	public O2UserDTO findAccount(String email) {
		// TODO Auto-generated method stub
		return userdao.findAccount(email);
	}
	public void findpwdupdate(String email, String pwd) {
		// TODO Auto-generated method stub
		HashMap<String,String> hm = new HashMap<String, String>();
		hm.put("email", email);
		hm.put("pwd", pwd);
		 userdao.findpwdupdate(hm);
		
	}
	public List<O2LikeDTO> mylikelist(String user_id) {
		// TODO Auto-generated method stub
		return userdao.mylikelist(user_id);
	}
	
		
	


}
	

	


			
		
	


