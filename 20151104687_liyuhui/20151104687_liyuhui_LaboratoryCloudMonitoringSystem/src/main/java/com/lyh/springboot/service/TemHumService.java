package com.lyh.springboot.service;

import java.util.List;

import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.TemHum;

public interface TemHumService {

	List<TemHum> selectByTemId();

	TemHum selectTemHum(Laboratory lab);

	List<TemHum> selectByLab(Laboratory lab);

}
