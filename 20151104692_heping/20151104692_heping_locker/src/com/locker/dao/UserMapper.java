package com.locker.dao;

import java.util.List;

import com.locker.domain.JsonMessage;
import com.locker.domain.User;

public interface UserMapper {
    int deleteByPrimaryKey(String uId);

    int insert(User user);

    int insertSelective(User user);

    User selectByPrimaryKey(String uId);

    int updateByPrimaryKeySelective(User user);

    int updateByPrimaryKey(User user);

    List<User> findAll();
    
    User selectFindShow(User user);
    
    User findName(String name);

	User YongHuMing(String uZh);

	List<User> backFindAll(User user);

	int backFindCount(String uZh);
}