
package cn.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.chat.pojo.Room;

public interface RoomDao {
	@Select("select id,name from room where status='01' order by ord desc")
	List<Room> findAllRooms();
	@Select("select id,name,userid,status from room where userid=#{userid} order by ord desc")
	List<Room> findAllRoomsByUserId(@Param("userid") Integer userid);
	@Select("select id,name,userid,status from room where status='00' order by ord desc")
	List<Room> findAllRoomsByAdmin();
	@Select("select id,name,userid,status from room order by ord desc")
	List<Room> findAllRoomsByAdminG();
	@Insert("insert into room(name,userid,status) values(#{name},#{userid},#{status})")
	int add(Room room);
	@Select("select id,name from room where name=#{name}")
	Room findRoomsByName(String name);
	@Update("update room set name=#{name} where id=#{id}")
	int updateRoomName(@Param("id") Integer id,@Param("name") String name);
	@Update("update room set status=#{status} where id=#{id}")
	int updateRoomStatus(@Param("id") Integer id,@Param("status") String status);
	
}
