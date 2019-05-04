package com.imnu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.imnu.po.Infm;
import com.imnu.po.Pinglun;
import com.imnu.po.User;

public interface INFDao {

	public List<Infm> selectjz();

	public void deletemy(@Param("u_email")String u_email);

	public List<Infm> selecttc();

	public List<User> selectall();

	public void deleteinf(@Param("u_email")String u_email);

	public void insertinf(@Param("u_name")String u_name, @Param("u_phone")String u_phone, @Param("u_email")String u_email, @Param("u_type")String u_type, @Param("p_img")String p_img, @Param("p_dirpath")String p_dirpath,
			@Param("u_message")String u_message);

	public void infsertpl(@Param("p_name")String name, @Param("p_email")String email, @Param("p_phone")String phone, @Param("p_content")String message, @Param("u_user")String u_user);

	public List<Pinglun> selectpl();
   
}
