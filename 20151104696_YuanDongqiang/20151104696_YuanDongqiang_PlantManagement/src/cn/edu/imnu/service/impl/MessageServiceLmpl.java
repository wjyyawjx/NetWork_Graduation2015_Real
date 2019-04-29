package cn.edu.imnu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.imnu.dao.MessageDao;
import cn.edu.imnu.po.Message;
import cn.edu.imnu.service.MessageService;

@Service("messageService")
@Transactional
public class MessageServiceLmpl implements MessageService{
	@Autowired
	private MessageDao messageDao;

	@Override
	public Integer AddMessage(Message message) {
		return messageDao.AddMessage(message);
	}
}
