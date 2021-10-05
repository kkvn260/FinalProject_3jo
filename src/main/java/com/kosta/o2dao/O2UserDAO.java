package com.kosta.o2dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2UserDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Mapper
public interface O2UserDAO {
		

	int signUser(O2UserDTO userdto) throws SQLException;//�쉶�썝媛��엯
	// int searchPassword(String user_id, String email,String key);//�쉶�썝�엫�떆 鍮꾨�踰덊샇
	O2UserDTO login(O2UserDTO userdto) throws Exception;
	int checkUserId(String user_id); //�븘�씠�뵒以묐났泥댄겕
	O2UserDTO memberdetail(String user_id);
	void modifyresult(O2UserDTO list);
    int delete(String user_id);
    List<O2WriteBoardDTO> mydboardlist(String user_id);
	List<O2DongComDTO> mydongboardlist(String user_id);
	List<O2QnaBoardDTO> myqnaboardlist(String user_id);


}
