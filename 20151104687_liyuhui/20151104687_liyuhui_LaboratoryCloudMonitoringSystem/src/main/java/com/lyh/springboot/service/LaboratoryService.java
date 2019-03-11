package com.lyh.springboot.service;

import java.util.List;

import com.lyh.springboot.pojo.Laboratory;


public interface LaboratoryService {

	public List<Laboratory> findLab();

	public List<Laboratory> list();

	public Laboratory get(long id);

	public void delete(long uid);

	public void update(Laboratory lab);

	public void add(Laboratory lab);

}
