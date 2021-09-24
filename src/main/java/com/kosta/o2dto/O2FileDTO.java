package com.kosta.o2dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class O2FileDTO {
	private String temp_name;
	private String real_name;
	private int tradeno;
	private int qnano;
	private int chatno;
}
