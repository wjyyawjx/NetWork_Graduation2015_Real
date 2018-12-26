package com.bs.sxd.service;

import com.bs.sxd.po.User;

/**
 * Service ½Ó¿Ú
 * 
 * @author ËïÑ©¶¬
 *
 */
public interface UserService {
	public User findUser(String username,String password);
}
