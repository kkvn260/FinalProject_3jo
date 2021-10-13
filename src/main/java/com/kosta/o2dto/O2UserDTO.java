package com.kosta.o2dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter  
@ToString
@NoArgsConstructor
public class O2UserDTO {

	private String user_id;
	private String pwd;
	private String phoneno;
	private String email;
	private String user_name;
	private String birthday;
	private String hint;
	private String hintanswer;
	private String addr1;
	private String addr2;
	private String gender;
	private int grade;
}
