package com.dao;

import com.model.Goods;
import com.tools.ChStr;
import com.tools.ConnDB;

public class GoodsDaoImpl implements GoodsDao {
	ConnDB conn = new ConnDB();//加载tools包下的方法类
	ChStr chStr = new ChStr();//加载tools包下的方法类
	
	/**
	 * 新增操作
	 * 
	 */
	public int insert(Goods g) {
		int ret = -1;//设定返回值变量
		try {
			//设定执行语句
			String sql = "Insert into tb_goods (TypeID,GoodsName,Introduce,Price,nowPrice,picture,newgoods,sale) values("
					+ g.getTypeID()
					+ ",'"
					+ chStr.chStr(g.getGoodsName())
					+ "','"
					+ chStr.chStr(g.getIntroduce())
					+ "',"
					+ g.getPrice()
					+ ","
					+ g.getPrice()
					+ ",'"
					+ chStr.chStr(g.getPicture())
					+ "',"
					+ g.getNewGoods()
					+ "," + g.getSale() + ")";

			ret = conn.executeUpdate(sql);//执行语句，与数据库相连接
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//关闭数据库连接
		return ret;
	}

	/**
	 * 更新操作
	 * 
	 */
	public int update(Goods g) {
		int ret = -1;//设定返回值变量
		try {
			//设定执行语句
			String sql = "update tb_Goods set TypeID=" + g.getTypeID()
					+ ",GoodsName='" + chStr.chStr(g.getGoodsName())
					+ "',introduce='" + chStr.chStr(g.getIntroduce())
					+ "',price=" + g.getPrice() + ",nowprice="
					+ g.getNowPrice() + ",picture='"
					+ chStr.chStr(g.getPicture()) + "',newgoods="
					+ g.getNewGoods() + ",sale=" + g.getSale() + " where ID="
					+ g.getID();
			ret = conn.executeUpdate(sql);//执行语句，与数据库相连接
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//关闭数据库连接
		return ret;
	}
	
	/**
	 * 删除操作
	 * 
	 */
	public int delete(Goods g) {
		int ret = -1;//设定返回值变量
		try {
			//设定执行语句
			String sql = "Delete from tb_goods where ID=" + g.getID();
			ret = conn.executeUpdate(sql);//执行语句，与数据库相连接
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//关闭数据库连接
		return ret;

	}

}