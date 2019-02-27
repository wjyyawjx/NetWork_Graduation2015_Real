package cn.edu.imnu.dao;

import cn.edu.imnu.po.IP;
import cn.edu.imnu.po.User;

public interface IndexDao {
	// 查询本机是否登陆过本系统
	public IP IpFind(String u_ip);

	// 通过id查询用户
	public User find(Integer u_id);

}
