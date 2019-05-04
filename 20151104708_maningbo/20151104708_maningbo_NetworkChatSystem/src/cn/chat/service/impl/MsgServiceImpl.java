
package cn.chat.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.chat.dao.MsgDao;
import cn.chat.dao.UserDao;
import cn.chat.pojo.Friend;
import cn.chat.pojo.Msg;
import cn.chat.pojo.UserBean;
import cn.chat.service.MsgService;
import cn.chat.service.UserService;


@Service
@Transactional
public class MsgServiceImpl implements MsgService {
	
	@Autowired
	private MsgDao msgDao;

	@Override
	public int saveMsg(Msg msg) {
		// TODO Auto-generated method stub
		return msgDao.saveMsg(msg);
	}

	@Override
	public int updateMsg(Msg msg) {
		// TODO Auto-generated method stub
		return msgDao.updateMsg(msg);
	}

	@Override
	public List<Msg> findMsgBySF(String sendusername, String fromusername) {
		// TODO Auto-generated method stub
		return msgDao.findMsgBySF(sendusername, fromusername);
	}

	
}
