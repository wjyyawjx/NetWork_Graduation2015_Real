package com.lyh.springboot.service;

import java.util.List;

import com.lyh.springboot.pojo.LabUser;
import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.User;

public interface LabUserService {

	void deleteByUser(Integer lId);

	void setUser(Laboratory lab, long[] userIds);

	void setUser2(Laboratory lab, long[] userIds, List<User> users);

	void addApplication(Long id, Integer lId);

	void updateEnter(Long id, Integer lId);

	void updateAdminEnter(Long id, Integer lId);

}
