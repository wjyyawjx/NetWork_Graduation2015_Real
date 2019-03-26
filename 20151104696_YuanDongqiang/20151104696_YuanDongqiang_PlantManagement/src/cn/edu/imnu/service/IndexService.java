package cn.edu.imnu.service;

import java.util.Date;

import cn.edu.imnu.po.IP;
import cn.edu.imnu.po.User;

public interface IndexService {
	// 更新登陆的IP
	public void addIp(IP ipAdress);

	// 查询用户信息
	public User find(Integer u_id);

	// 查询本机是否使用过该系统
	public User IpFind1(String u_ip);
	
	public IP IpFind(String u_ip);

	// 更新IP地址
	public void updateIp(IP ipAdress);

	public void updateIp1(User user);

	public void addIp1(String u_ip, Date u_time);

}
