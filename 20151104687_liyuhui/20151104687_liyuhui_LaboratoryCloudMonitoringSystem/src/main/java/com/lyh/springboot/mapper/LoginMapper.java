package com.lyh.springboot.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lyh.springboot.pojo.Login;
import com.lyh.springboot.pojo.Student;
import com.lyh.springboot.pojo.Teacher;

@Mapper
public interface LoginMapper {
	@Select("select * from login where num = #{num} and password = #{pwd}")
	Login login(@Param("num")String num, @Param("pwd")String pwd);

	@Insert("insert into login (num,password,u_type) values (#{num},#{pwd},#{type})")
	void addUser(@Param("num")String num, @Param("pwd")String pwd, @Param("type")int type);

	@Select("select * from login where num = #{num}")
	Login findpwdUser(@Param("num")String num);

	@Update("update login set password=#{pwd} where num=#{num}")
	void findpwd(@Param("pwd")String pwd, @Param("num")String num);

	@Insert("insert into student (s_name,s_num,s_tel,s_email,s_sex,s_age) values (#{name},#{num},#{tel},#{email},#{sex},#{age})")
	void perfectInformation_s(@Param("name")String name, @Param("tel")String tel, @Param("sex")String sex, @Param("email")String email, @Param("age")String age, @Param("num")String num);

	@Insert("insert into teacher (t_name,t_num,t_tel,t_email) values (#{name},#{num},#{tel},#{email})")
	void perfectInformation_t(@Param("name")String name, @Param("tel")String tel, @Param("email")String email, @Param("num")String num);

	@Select("select * from student where s_num = #{num}")
	Student findStudent(@Param("num")String num);

	@Select("select * from teacher where t_num = #{num}")
	Teacher findTeacher(@Param("num")String num);
}
