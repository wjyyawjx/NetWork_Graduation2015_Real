package com.qst.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qst.dao.BaseDao;
import com.qst.dao.RecommendDao;
import com.qst.bean.RecommendBean;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description对推荐表的操作类
 *
 */
public class RecommendDaoimp extends BaseDao implements RecommendDao {

	@Override
	//获取所有推荐信息
	public List<RecommendBean> getAllRecommend() {
		List<RecommendBean> list = new ArrayList<RecommendBean>();
		String sql = "select`Comname`,`price` from Recommend ";
		Object[] params = {};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while (rs.next()) {
				RecommendBean rec = new RecommendBean();
				rec.setComname(rs.getString("comname"));
				rec.setPrice(rs.getString("price"));
				list.add(rec);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	//获取指定推荐商品信息
	public RecommendBean getRecommendMoreInfo(RecommendBean recommend) {
		RecommendBean rec = new RecommendBean();
		String sql = "select `Comname`,`price`from Recommend where `comid`=?";
		Object[] params = { recommend.getComid() };
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while (rs.next()) {
				
				rec.setComname(rs.getString("comname"));
				rec.setPrice(rs.getString("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rec;
	}

	@Override
	//添加商品信息
	public int addRecommend(RecommendBean recommend) {
		int row = 0;
		System.out.println(recommend.getPrice());
		String sql = "insert into recommend(`comname`,`price`) values(?,?)";
		Object[] params = {recommend.getComname(),recommend.getPrice()};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("添加商品信息成功");
		}else{
			System.out.println("添加商品信息失败");
		}
		return row;
	}

	@Override
	//删除商品信息
	public int delRecommend(RecommendBean recommend) {
		int row = 0;
		String sql = "delete from Recommend where `comid`=?";
		Object[] params = {recommend.getComid()};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("success");
		}else{
			System.out.println("erro");
		}
		return row;
	}

	@Override
	//修改商品信息
	public int modifyRecommend(RecommendBean recommend) {
		int row = 0;
		String sql = "update recommend set comname=?,price=? where comid=?";
		Object[] params = {recommend.getComname(),recommend.getPrice(),recommend.getComid()};
		System.out.println(recommend.getComname());
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("修改商品信息成功");
		}else{
			System.out.println("修改商品信息失败");
		}
		
		return row;
	}
	
	
	//查询商品信息
	public boolean findRecommend(RecommendBean recommend){
		boolean flag = true;
		int row = 0;
		String sql = "select count(1) from Recommend where  `Comname`=? and `price`=?";
		Object[] params = {recommend.getComname(),recommend.getPrice()};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while(rs.next()){
				row = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(row>0){
			System.out.println("查询商品信息成功");
			flag = true;
		}else{
			System.out.println("查询商品信息失败");
			flag = false;
		}
		
		return flag;
		
	}

	@Override
	public int delRecommendt(RecommendBean recommend) {
		// TODO Auto-generated method stub
		return 0;
	}
}

