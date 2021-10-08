package com.kosta.jo3;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.o2.task.SearchFilter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
public class searchFilterTest {

	@Autowired
	private SearchFilter filter;
	
	@Test
	public void getInsertTest() {
		filter.scrapMobileData();
	}
}
