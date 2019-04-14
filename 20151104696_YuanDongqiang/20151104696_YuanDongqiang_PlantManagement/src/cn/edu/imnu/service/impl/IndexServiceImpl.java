package cn.edu.imnu.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.imnu.dao.IndexDao;
import cn.edu.imnu.po.IP;
import cn.edu.imnu.po.User;
import cn.edu.imnu.service.IndexService;

/**
 * 用户Service接口实现类
 */
@Service("indexService")
@Transactional
public class IndexServiceImpl implements IndexService {
	@Autowired
	private IndexDao indexDao;

	@Override
	public User find(Integer u_id) {
		return indexDao.find(u_id);
	}

	@Override
	public IP IpFind(String u_ip) {
		return indexDao.IpFind(u_ip);
	}

	@Override
	public void addIp(IP ipAdress) {
		indexDao.addIp(ipAdress);

	}

	@Override
	public void updateIp(IP ipAdress) {
		indexDao.updateIp(ipAdress);

	}

	@Override
	public User IpFind1(String u_ip) {
		return indexDao.IpFind1(u_ip);
	}

	@Override
	public void updateIp1(User user) {
		indexDao.updateIp1(user);

	}

	@Override
	public void addIp1(String u_ip, Date u_time) {
		User user = new User();
		user.setU_ip(u_ip);
		user.setU_time(u_time);
		indexDao.addIp1(user);
	}

}
