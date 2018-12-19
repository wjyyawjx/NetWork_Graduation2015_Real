package com.imnu.common;

/**
 * 描述:分页对象
 */
public class Page {
	
	private int curPage =1;//当前页数
	private int rows = 5 ;//每页多少行
	private int startRows ; //开始行数
	private int totalRows ;//总行数
	private int totalPages ;//总页数
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getStartRows() {
		startRows = (curPage-1)*rows;
		return startRows;
	}
	public void setStartRows(int startRows) {
		this.startRows = startRows;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
		if(totalRows%rows==0){
			totalPages = totalRows/rows;
		}else{
			totalPages = (totalRows/rows)+1;
		}
	}
	
	public int getTotalPages() {
		
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	
}

