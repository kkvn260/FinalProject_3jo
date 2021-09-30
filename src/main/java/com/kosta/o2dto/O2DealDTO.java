package com.kosta.o2dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class O2DealDTO {
	private int tradeno;
	private String user_id;
	private int deal_price;
	private String endtime;
}
