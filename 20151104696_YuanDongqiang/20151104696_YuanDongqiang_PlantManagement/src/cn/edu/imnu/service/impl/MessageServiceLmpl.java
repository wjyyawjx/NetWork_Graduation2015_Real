package cn.edu.imnu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.edu.imnu.dao.MessageDao;
import cn.edu.imnu.service.MessageService;

public class MessageServiceLmpl implements MessageService{
	@Autowired
	private MessageDao messageDao;
}
