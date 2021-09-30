package com.kosta.o2dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@NoArgsConstructor
public class O2WriteBoardDTO {
	private int tradeno;
	private String title;
	private String user_id;
	private String content;
	private String category1;
	private String category2;
	private String sell_price;
	private int likeno;
	private String writedate;
	private String deal_price;
	private String map_x;
	private String map_y;
	private String tradeaddr;
	private int viewno;
}
