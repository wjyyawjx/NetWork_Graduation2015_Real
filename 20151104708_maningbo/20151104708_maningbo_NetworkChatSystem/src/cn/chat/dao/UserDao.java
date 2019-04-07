
package cn.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.chat.pojo.Friend;
import cn.chat.pojo.UserBean;
import cn.chat.pojo.UserBeanVo;

public interface UserDao {
	//(userName,Gender,Phone,Email)
//	@Update("update userinfo set Gender=#{gender},Phone=#{phone},Email=#{email},birthDay=#{birthDay},image=#{image} where id=#{id}")
	public int updateUserInfo(UserBean userBean);
	@Update("update userinfo set userPass=#{userPass} where id=#{id}")
	public int updatePass(UserBean userBean);
	@Update("update userinfo set flag=#{flag} where id=#{id}")
	public int updateFlag(UserBean userBean);
	
	public UserBean findUserByUserName(@Param("userName") String userName, @Param("userPass") String userPass);
	public UserBean findUserByUserNameFlag(@Param("userName") String userName, @Param("userPass") String userPass);

	public void addUser(UserBean userBean);

	public boolean update(@Param("userName") String userName, @Param("userPass") String userPass,
			@Param("phoneNumber") String phoneNumber, @Param("email") String email, @Param("id") Integer id);

	public UserBean findUserById(int id);

	public UserBean findUserByName(String userName);

	public List<UserBean> findAllUser();
	
	@Select("select userid,`status`,count(`status`) count from room group by userid,`status` HAVING userid=#{userid} ORDER BY `STATUS`")
	public List<UserBeanVo> findAllUserByStatus(@Param("userid")Integer userid);

	public List<Friend> myFriend(@Param("userName") String userName);

	public void addFriend(Friend friend);
	
	public UserBean findUserByEmail(String email);

}
