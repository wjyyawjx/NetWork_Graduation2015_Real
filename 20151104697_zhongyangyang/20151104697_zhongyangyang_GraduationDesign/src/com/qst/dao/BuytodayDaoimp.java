package com.qst.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qst.dao.BaseDao;
import com.qst.dao.BuytodayDao;
import com.qst.bean.BuytodayBean;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description对推荐表的操作类
 *
 */
public class BuytodayDaoimp extends BaseDao implements BuytodayDao {

	@Override
	//获取所有推荐信息
	public List<BuytodayBean> getAllBuytoday() {
		List<BuytodayBean> list = new ArrayList<BuytodayBean>();
		String sql = "select * from buytoday ";
		Object[] params = {};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while (rs.next()) {
				BuytodayBean buy = new BuytodayBean();
				buy.setTodayid(rs.getInt("todayid"));
				buy.setTyname(rs.getString("tyname"));
				buy.setOriginal(rs.getString("original"));
				buy.setPresent(rs.getString("present"));
				buy.setDscount(rs.getString("dscount"));
				buy.setPicturename(rs.getString("picturename"));
				list.add(buy);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	//获取指定推荐商品信息
	public BuytodayBean getBuytodayMoreInfo(BuytodayBean buy) {
		BuytodayBean buytoday = new BuytodayBean();
		String sql = "select * from buytoday where `todayid`=?";
		Object[] params = { buy.getTodayid() };
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while (rs.next()) {
				
				buy.setTyname(rs.getString("tyname"));
				buy.setOriginal(rs.getString("original"));
				buy.setPresent(rs.getString("present"));
				buy.setDscount(rs.getString("dscount"));
				buy.setPicturename(rs.getString("picturename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buy;
	}

	@Override
	//添加商品信息
	public int addBuytoday(BuytodayBean buy) {
		int row = 0;
		String sql = "insert into buytoday(`tyname`,`original`,`present`,`dscount`,`picture`,`picturename`) values(?,?,?,?,?,?)";
		Object[] params = {buy.getTyname(),buy.getOriginal(),buy.getPresent(),buy.getDscount(),buy.getPicture(),buy.getPicturename()};
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
	public int delBuytoday(BuytodayBean buy) {
		int row = 0;
		String sql = "delete from buytoday where `todayid`=?";
		Object[] params = {buy.getTodayid()};
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
	public int modifyBuytoday(BuytodayBean buy) {
		int row = 0;
		String sql = "update buytoday set tyname=?,original=?,present=?,dscount=?,picture=?,picturename=? where todayid=?";
		Object[] params = {buy.getTyname(),buy.getOriginal(),buy.getPresent(),buy.getDscount(),buy.getPicture(),buy.getPicturename(),buy.getTodayid()};
		System.out.println(buy.getTyname());
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("修改商品信息成功");
		}else{
			System.out.println("修改商品信息失败");
		}
		
		return row;
	}
	
	
	//查询商品信息
	public boolean findBuytoday(BuytodayBean buy){
		boolean flag = true;
		int row = 0;
		String sql = "select count(1) from buytoday where  `tyname`=? and `original`=? and `present`=? and `dscount`=? and `picture`=? and `picturename`=?";
		Object[] params = {buy.getTyname(),buy.getOriginal(),buy.getPresent(),buy.getDscount(),buy.getPicture(),buy.getPicturename()};
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
	public int delBuytoday1(BuytodayBean buytoyday) {
		// TODO Auto-generated method stub
		return 0;
	}
}


