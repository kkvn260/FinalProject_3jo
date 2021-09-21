package com.kosta.o2dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@NoArgsConstructor
public class O2QnaBoardDTO {
	
	private int qnano;
	private String user_id;
	private String content;
	private String category;
	private String writedate;
	private String file_name;
}
