package com.lyh.springboot.service;

import com.lyh.springboot.pojo.Laboratory;

public interface LabUserService {

	void deleteByUser(long uid);

	void setUser(Laboratory lab, long[] userIds);

}
