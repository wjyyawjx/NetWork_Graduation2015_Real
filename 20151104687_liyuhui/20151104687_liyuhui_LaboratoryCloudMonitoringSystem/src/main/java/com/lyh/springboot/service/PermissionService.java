package com.lyh.springboot.service;

import java.util.List;
import java.util.Set;

import com.lyh.springboot.pojo.Permission;
import com.lyh.springboot.pojo.Role;


public interface PermissionService {
	public Set<String> listPermissions(String userName);

	public List<Permission> list();

	public void add(Permission permission);

	public void delete(Long id);

	public Permission get(Long id);

	public void update(Permission permission);

	public List<Permission> list(Role role);

	public boolean needInterceptor(String requestURI);

	public Set<String> listPermissionURLs(String userName);

}