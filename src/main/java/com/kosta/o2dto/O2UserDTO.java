package com.kosta.o2dto;

import lombok.Getter;

import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class O2UserDTO {

	private String user_id;
	private String pwd;
	private String nick_name;
	private String phoneno;
	private String email;
	private String user_name;
	private String birthday;
	private String addr;
	private String gender;
	private int grade;
}
