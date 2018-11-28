
package cn.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.chat.pojo.UserBean;

public interface UserDao {
	
	public UserBean findUserByUserName(@Param("userName") String userName,
									@Param("userPass") String userPass);
	public void addUser(UserBean userBean);
	
	public boolean update(@Param("userName") String userName, 
							@Param("userPass") String userPass,
							@Param("phoneNumber")  String phoneNumber, 
							@Param("email") String email,
							@Param("id")Integer id);
	
	public UserBean findUserById(int id);
	
	

}

