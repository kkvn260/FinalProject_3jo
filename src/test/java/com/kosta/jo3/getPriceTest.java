package com.kosta.jo3;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.o2dao.O2WriteDAO;
import com.kosta.o2writeservice.O2WriteService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@Slf4j
public class getPriceTest {

	@Autowired
	private O2WriteService service;
	@Autowired
	private O2WriteDAO dao;

	@Test
	public void getDayPriceTest() {
		HashMap<String, Object> hm = new HashMap<>();

		String itemProd = "아이폰8플러스 (64GB)";
		String category = "item_name";

		hm.put("itemProd", itemProd);
		hm.put("category", category);
		assertEquals("아이폰8플러스 (64GB)", dao.getDayPrice(hm).getItem_name());
		
	}

	@Test
	public void getWeekPriceTest() {
		HashMap<String, Object> hm = new HashMap<>();

		String itemProd = "아이폰13 미니";
		String category = "item_name";
		hm.put("itemProd", itemProd);
		hm.put("category", category);
		
		assertEquals("아이폰13 미니", dao.getWeekPrice(hm).getItem_name());
	}
	
	@Test
	public void getMonthPriceTest() {
		HashMap<String, Object> hm = new HashMap<>();

		String itemProd = "아이폰13 미니";
		String category = "item_name";
		hm.put("itemProd", itemProd);
		hm.put("category", category);
		
		assertEquals("아이폰13 미니 (128GB)", dao.getMonthPrice(hm).getItem_name());
	}

}
