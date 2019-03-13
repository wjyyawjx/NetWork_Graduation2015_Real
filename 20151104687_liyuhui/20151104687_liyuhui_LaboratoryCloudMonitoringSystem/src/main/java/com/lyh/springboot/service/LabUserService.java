package com.lyh.springboot.service;

import com.lyh.springboot.pojo.Laboratory;

public interface LabUserService {

	void deleteByUser(Integer lId);

	void setUser(Laboratory lab, long[] userIds);

}
