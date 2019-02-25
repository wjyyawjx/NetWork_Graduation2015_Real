package cn.edu.imnu.service;

import cn.edu.imnu.po.IP;
import cn.edu.imnu.po.User;

public interface JZIndexService {
	// 判断本机是否使用过该系统
	public IP IpFind(String u_ip);

	// 查询用户信息
	public User find(Integer u_id);

	// 查询该本机是否使用过该系统
	public void addIp(IP ipAdress);

	// 更新本机的登陆时间
	public void updateIp(IP ipAdress);

}
