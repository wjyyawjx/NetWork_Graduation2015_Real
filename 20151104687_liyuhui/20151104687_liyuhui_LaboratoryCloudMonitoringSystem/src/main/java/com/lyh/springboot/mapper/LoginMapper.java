package com.lyh.springboot.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lyh.springboot.pojo.Login;

@Mapper
public interface LoginMapper {
	@Select("select * from login where num = #{num} and password = #{pwd}")
	Login login(@Param("num")String num, @Param("pwd")String pwd);

	@Insert("insert into login (num,password,u_type) values (#{num},#{pwd},#{type})")
	void addUser(@Param("num")String num, @Param("pwd")String pwd, @Param("type")String type);

	@Select("select * from login where num = #{num}")
	Login findpwdUser(@Param("num")String num);

	@Update("update login set password=#{pwd} where num=#{num}")
	void findpwd(@Param("pwd")String pwd, @Param("num")String num);
}
