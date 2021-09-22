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
		startRow = (currPage - 1) * pageSize + 1;
		endRow = startRow + pageSize - 1;

		if (endRow > totalCount)
			endRow = totalCount;
	}

	
	private void calBlock() {
		int totalPage = (int) Math.ceil(totalCount / (float) (pageSize));

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
