package com.kosta.o2dto;

import lombok.Getter;

@Getter
public class O2Page {

	private int currPage;
	private int totalCount;
	private int startRow;
	private int endRow;
	private int pageSize;
	private int startBlock;
	private int endBlock;
	private int blockSize;
	private boolean next;
	private boolean prev;
	
	
	private void calRow() {
		startRow = (currPage - 1) * pageSize;  //1page :0,10  2page: 10,10  3page: 20, 10
		
	}

	
	private void calBlock() {
		int totalPage = (int) Math.ceil(totalCount / (float) (pageSize));

		//System.out.println("totalPage:" + totalPage);
		startBlock = (currPage-1)/blockSize * blockSize + 1; // 1 2 3 4 5
		endBlock = startBlock + blockSize - 1;
				
		if (endBlock > totalPage)
			endBlock = totalPage;
		
		prev = (startBlock == 1) ? false : true;
		next = (endBlock < totalPage) ? true : false;
	}

	
	public O2Page(int currPage, int totalCount, int pageSize, int blockSize) {
		super();
		this.currPage = currPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		
		calRow();
		calBlock();
	}

}
