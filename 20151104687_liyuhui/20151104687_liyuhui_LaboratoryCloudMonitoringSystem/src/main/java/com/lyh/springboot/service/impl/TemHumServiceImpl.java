package com.lyh.springboot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyh.springboot.mapper.TemHumMapper;
import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.TemHum;
import com.lyh.springboot.service.TemHumService;

@Service
public class TemHumServiceImpl implements TemHumService {

		@Autowired
		TemHumMapper temHumMapper;

		@Override
		public List<TemHum> selectByTemId() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public TemHum selectTemHum(Laboratory lab) {
			// TODO Auto-generated method stub
			return temHumMapper.selectTemHum(lab.getTemId());
		}

		@Override
		public List<TemHum> selectByLab(Laboratory lab) {
			// TODO Auto-generated method stub
			return temHumMapper.selectByLab(lab.getTemId());
		}

}
