package com.kosta.o2dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class O2ReplyDTO {
	private int replyno;
	private String reply_content;
	private String reply_writedate;
	private int chatno;
	private int qnano;
	private int tradeno;
	private String user_id;
	private int dept;
	private int reparent;
	private int reorder;
	private String sell_price;
	private String deal_price;
}
