package com.imnu.service;

import java.util.List;

import com.imnu.po.Infm;
import com.imnu.po.Pinglun;
import com.imnu.po.User;

public interface INFService {

	public List<Infm> selectjz();

	public void deletemy(String u_email);

	public List<Infm> selecttc();

	public List<User> selectall();

	public void deleteinf(String u_email);

	public void insertinf(String u_name, String u_phone, String u_email, String u_type, String p_img, String p_dirpath,
			String u_message);

	public void insertpl(String name, String email, String phone, String message, String u_user);

	public List<Pinglun> Selectpl();


}
