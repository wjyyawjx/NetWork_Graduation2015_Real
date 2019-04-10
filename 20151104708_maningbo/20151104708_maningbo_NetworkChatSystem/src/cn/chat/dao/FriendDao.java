
package cn.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.chat.pojo.Friend;
import cn.chat.pojo.UserBean;

public interface FriendDao {
	@Delete("delete from friend where friend_1=#{friend_1} and friend_2=#{friend_2}")
	int deleteFrient(@Param("friend_1")String friend_1,@Param("friend_2")String friend_2);
	@Select("select *from friend where friend_1=#{friend_1}  and f1_allow='0'")
	List<Friend> selectFriendIsValidate(@Param("friend_1") String friend_1);
	@Select("select *from friend where friend_2=#{friend_1}  and f1_allow='0'")
	List<Friend> selectFriendIsValidateO(@Param("friend_1") String friend_1);
	@Update("update friend set f1_allow=#{f1_allow} where friend_1=#{friend_1} and friend_2=#{friend_2}")
	int updateFriendIsValidate(@Param("friend_1") String friend_1,@Param("friend_2") String friend_2,@Param("f1_allow") String f1_allow);
}
