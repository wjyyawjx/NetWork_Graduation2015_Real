package com.lyh.springboot.service;

import java.util.List;
import java.util.Map;

import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.User;


public interface LaboratoryService {

	public List<Laboratory> findLab();

	public List<Laboratory> list();

	public Laboratory get(Integer lId);

	public void delete(Integer lId);

	public void update(Laboratory lab);

	public void add(Laboratory lab);

	public List<Laboratory> listMineLab(Long id);

	public List<Laboratory> listApplicationLab(Long id);

	public List<Laboratory> listUnauthorizedLab(Long id);

	public List<Laboratory> listWaitLab(Long id);

	public Map<List<Laboratory>, List<User>> listAllWaitLab();

	public List<Laboratory> listWaitLab2(Long id);

}
