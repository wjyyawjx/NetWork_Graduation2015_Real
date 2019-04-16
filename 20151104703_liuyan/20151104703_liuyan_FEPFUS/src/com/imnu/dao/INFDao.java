package com.imnu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.imnu.po.Infm;

public interface INFDao {

	public List<Infm> selectjz();

	public void deletemy(@Param("u_id")int u_id);
   
}
