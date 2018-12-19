package com.lyh.springboot.service;

import com.lyh.springboot.pojo.User;

public interface UserRoleService {

	public void setRoles(User user, long[] roleIds);

	public void deleteByUser(long userId);

	public void deleteByRole(long roleId);

	void setRoles(User user, Integer[] roleIds);

}