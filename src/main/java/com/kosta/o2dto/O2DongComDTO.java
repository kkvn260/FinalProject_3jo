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
	private String category1;
	private String category2;
	private int likeno;
	private String writedate;
	private String map_x;
	private String map_y;
	private int viewno;
	private String real_name;
}
