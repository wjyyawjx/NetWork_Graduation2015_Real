
package cn.chat.service;

import java.util.List;

import cn.chat.pojo.Friend;
import cn.chat.pojo.UserBean;

public interface UserService {
	public int updateUserInfo(UserBean userBean);
	public UserBean findUserByUserName(String userName, String userPass);

	public void addUser(UserBean userBean);

	public boolean update(String userName, String userPass, String phoneNumber, String email, Integer id);

	public UserBean findUserById(int id);

	public List<UserBean> findAllUser();

	public UserBean findUserByName(String userName);

	public List<Friend> myFriend(String userName);

	public void addFriend(String userName, String friend_2);
	
	public UserBean findUserByEmail(String email);
}
