package com.kosta.o2service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2WriteDAO;
import com.kosta.o2dto.MobileVo;
import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Service
public class O2ServiceImpleOther implements O2ServiceOther {
	@Resource(name = "o2WriteDAO")
	private O2WriteDAO dao;

	@Override
	public List<O2WriteBoardDTO> topview() {
		// TODO Auto-generated method stub
		return dao.topviewlist();
	}

	@Override
	public List<O2QnaBoardDTO> qnalist() {
		// TODO Auto-generated method stub
		return dao.getqlist();
	}

	@Override
	public List<O2DongComDTO> dongcomlist() {
		// TODO Auto-generated method stub
		return dao.getdonglist();
	}

	@Override
	public List<O2DongComDTO> dongtopview() {
		// TODO Auto-generated method stub
		return dao.dongtopviewlist();
	}

	@Override
	public void removeSearchData() {
		dao.removeSearchData();
	}

	@Override
	public int getMobileData() {

		int result = 0;
		try {
			String mainURL = "https://price.cetizen.com/price.php";
			Connection conn = Jsoup.connect(mainURL);
			Document doc = conn.get();

			Elements element = doc.select("#price_tbody");

			Iterator<Element> phoneNames = element.select("td.w-35").iterator();
			Iterator<Element> productNums = element.select(".gray.ls-0.w-20").iterator();
			Iterator<Element> productPrices = element.select(".text-right").iterator();

			List<MobileVo> mobileList = new ArrayList<>();

			while (productNums.hasNext()) {

				MobileVo mobileVo = new MobileVo();

				String item_name = phoneNames.next().text();
				String product_no = productNums.next().text();
				int price = (Integer.parseInt(productPrices.next().text()));

				mobileVo.setItem_name(item_name);
				mobileVo.setProduct_no(product_no);
				mobileVo.setPrice(price);

				mobileList.add(mobileVo);
			}

			result = dao.getMobileData(mobileList);

		} catch (IOException e) {
			System.out.println(e);
		}
		
		return result;
	}

}
