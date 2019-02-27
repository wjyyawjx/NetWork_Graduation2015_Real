package cn.edu.imnu.service.impl;

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
	private	IndexDao indexDao;

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
		// TODO Auto-generated method stub
		
	}

}
