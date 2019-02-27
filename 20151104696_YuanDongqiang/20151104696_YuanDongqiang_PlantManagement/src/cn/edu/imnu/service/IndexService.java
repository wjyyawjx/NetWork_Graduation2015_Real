package cn.edu.imnu.service;

import cn.edu.imnu.po.IP;
import cn.edu.imnu.po.User;

public interface IndexService {
	// 更新登陆的IP
	public void addIp(IP ipAdress);

	// 查询用户信息
	public User find(Integer u_id);
	
	//查询本机是否使用过该系统
	public IP IpFind(String u_ip);

}
