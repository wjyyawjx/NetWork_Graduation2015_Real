/**
 * 
 */
package com.yidu.common;

/**
 * 分页工具类
 * @author liandyao
 * @date 2017年9月29日 下午6:16:21
 * @version 1.0
 */
public class Pages {
	
	private int curPage = 1 ; //当前页数
	private int totalRows; //总记录数
	private int firstRows; //开始的行数 --需要计算的
	private int maxResult=5; //每页最大显示条数
	private int totalPage ;//总页数  --需要计算的
	
	public int getTotalPage() {
		if(totalRows%maxResult==0){
			totalPage = totalRows/maxResult ; //50    5  应该多少页 11
		}else{
			totalPage = totalRows/maxResult+1 ;
		}
		
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getFirstRows() {
		firstRows = maxResult*(curPage-1);
		return firstRows;
	}
	public void setFirstRows(int firstRows) {
		this.firstRows = firstRows;
	}
	public int getMaxResult() {
		return maxResult;
	}
	public void setMaxResult(int maxResult) {
		this.maxResult = maxResult;
	}
}
