package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tools.ConnDB;

import com.model.*;

public class UploadDao {

	public void addFile(Goods goods) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = ConnDB.getConnection();
		String sql = "insert into tb_goods(picture,goodsName,typeID,introduce,price,nowPrice,INTime,newGoods,sale) values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,goods.getPicture());
			stmt.setString(2,goods.getGoodsName());
			stmt.setInt(3,goods.getTypeID());
			stmt.setString(4,goods.getIntroduce());
			stmt.setDouble(5,goods.getPrice());
			stmt.setDouble(6,goods.getNowPrice());
			stmt.setString(7,goods.getINTime());
			stmt.setInt(8,goods.getNewGoods());
			stmt.setInt(9,goods.getSale());
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exceptions
			e.printStackTrace();
		}finally {
			// TODO: handle finally clause
			conn.close();
			stmt.close();
			rs.close();
		}
	}

}
