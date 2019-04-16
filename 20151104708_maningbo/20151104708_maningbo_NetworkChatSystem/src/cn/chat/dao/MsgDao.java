
package cn.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.chat.pojo.Msg;

public interface MsgDao {
	@Insert("insert into msg(username,message,img,`from`,isread) values(#{username},#{message},#{img},#{from},#{isread})")
	int saveMsg(Msg msg);
	@Update("update msg set isread=#{isread} where username=#{username} and `from`=#{from}")
	int updateMsg(Msg msg);
	@Select("select * from msg where username=#{username} and `from`=#{from} and isread=0")
	List<Msg> findMsgBySF(@Param("username") String username,@Param("from") String from);
}
