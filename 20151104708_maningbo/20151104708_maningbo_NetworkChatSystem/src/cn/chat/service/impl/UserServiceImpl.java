
package cn.chat.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.chat.dao.UserDao;
import cn.chat.pojo.Friend;
import cn.chat.pojo.UserBean;
import cn.chat.service.UserService;


@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public UserBean findUserById(int id) {
		UserBean userBean = this.userDao.findUserById(id);
		return userBean;
	}

	public void addUser(UserBean userBean) {
		this.userDao.addUser(userBean);
	}

	@Override
	public boolean update(String userName, String userPass, String phoneNumber, String email,Integer id) {
		// TODO Auto-generated method stub
		return userDao.update(userName, userPass, phoneNumber, email,id);
	}
	@Override
	public UserBean findUserByUserName(String userName, String userPass) {
		UserBean userBean = this.userDao.findUserByUserName(userName,userPass);
		return userBean;
	}

	@Override
	public List<UserBean> findAllUser() {
		// TODO Auto-generated method stub
		return userDao.findAllUser();
	}

	@Override
	public UserBean findUserByName(String userName) {
		// TODO Auto-generated method stub
		return userDao.findUserByName(userName);
	}

	@Override
	public List<Friend> myFriend(String userName) {
		// TODO Auto-generated method stub
		return userDao.myFriend(userName);
	}

	@Override
	public void addFriend(String userName, String friend_2) {
		// TODO Auto-generated method stub
		Friend friend=new Friend();
		friend.setFriend_1(userName);
		friend.setFriend_2(friend_2);
		friend.setF1_allow("0");
		friend.setF2_allow(new Date());
		this.userDao.addFriend(friend);
	}

	@Override
	public UserBean findUserByEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.findUserByEmail(email);
	}

	@Override
	public int updateUserInfo(UserBean userBean) {
		// TODO Auto-generated method stub
		return userDao.updateUserInfo(userBean);
	}



	
}
