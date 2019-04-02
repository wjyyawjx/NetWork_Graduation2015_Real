package com.bs.common.utils;
import java.util.List;


public class Page<T> {   
	private int total;    // 总条数
	private int page;     // 当前页
	private int size;     // 每页数
	private List<T> rows; // 结果集
	private List<T> rows_u; // 用户结果集
	private List<T> rows_ug; // 用户查询个人商品结果集
	private List<T> rows_p; // 评价信息结果集
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public List<T> getRows_u() {
		return rows_u;
	}
	public void setRows_u(List<T> rows_u) {
		this.rows_u = rows_u;
	}
	public List<T> getRows_ug() {
		return rows_ug;
	}
	public void setRows_ug(List<T> rows_ug) {
		this.rows_ug = rows_ug;
	}
	public List<T> getRows_p() {
		return rows_p;
	}
	public void setRows_p(List<T> rows_p) {
		this.rows_p = rows_p;
	}
}