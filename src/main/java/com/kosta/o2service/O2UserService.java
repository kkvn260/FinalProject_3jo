package com.kosta.o2service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2UserDAO;
import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2ReplyDTO;
import com.kosta.o2dto.O2UserDTO;
import com.kosta.o2dto.O2WriteBoardDTO;


@Service
public class O2UserService {
  
	
	@Autowired
	private O2UserDAO userdao;
	
	//�쉶�썝媛��엯
	public int signUser(O2UserDTO userdto) {
		int resultcount =0;
		
		
		try {
			resultcount = userdao.signUser(userdto);
			System.out.println("dto 확인" +userdto.getUser_id()); 
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
	public String findpwd(String user_id, String hint) {
		// TODO Auto-generated method stub
		HashMap<String, String> hm=new HashMap<String, String>();
		hm.put("user_id", user_id);
		hm.put("hint", hint);
		return userdao.findpwdcheck(hm);
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


}