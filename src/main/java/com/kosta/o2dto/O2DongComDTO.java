package com.kosta.o2dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
public class O2DongComDTO {
	
	private int chatno;
	private String title;
	private String user_id;
	private String content;
	private String category;
	private int likeno;
	private String writedate;
	private String map_x;
	private String map_y;
	private String addr1;
	private String addr2;
	private int viewno;
	private String real_name;
}
