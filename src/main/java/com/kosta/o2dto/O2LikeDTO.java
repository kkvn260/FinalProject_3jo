package com.kosta.o2dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class O2LikeDTO {
	public O2LikeDTO(String user_id, int tradeno) {
		this.user_id=user_id;
		this.tradeno=tradeno;
	}
	private int likeno;
	private String user_id;
	private int chatno;
	private int tradeno;
	private String writedate;
	private String title;
	private String addr1;
	private String addr2;
	private String deal_price;
	private String sell_price;
}
