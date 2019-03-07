package com.lyh.springboot.service;

import java.util.List;

import com.lyh.springboot.pojo.TemHum;

public interface TemHumService {

	List<TemHum> selectByTemId();

}
