package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TLaoshiDAO;
import com.dao.TUserDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport
{
	private Integer userId;
	private String userName;
	private String userPw;
	private String userRealname;
	
	private String userSex;
	private Integer laoshiId;
	private String userTel;
	private String userEmail;
	
	private String userDel;
   
	
	private String message;
	private String path;
	
	private TUserDAO userDAO;
	private TLaoshiDAO laoshiDAO;
	
	public String userReg()
	{
		String sql="from TUser where userName=? and userDel='no'";
		Object[] c={userName.trim()};
		List list=userDAO.getHibernateTemplate().find(sql,c);
		if(list.size()>0)
		{
			this.setMessage("学号已经注册");
			this.setPath("qiantai/default.jsp");
			return "succeed";
		}
		
		TUser user=new TUser();
		
		//user.setUserId(userId);
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserRealname(userRealname);
		
		user.setUserSex(userSex);
		user.setLaoshiId(laoshiId);
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
		
		user.setUserDel("no");
		
		userDAO.save(user);
		
		
		this.setMessage("ע注册成功，请登录");
		this.setPath("qiantai/default.jsp");
		return "succeed";
	}
	
	
	
	public String userEditMe()
	{
		TUser user=userDAO.findById(userId);

		//user.setUserId(userId);
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserRealname(userRealname);
		
		user.setUserSex(userSex);
		user.setLaoshiId(laoshiId);
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
		
		user.setUserDel("no");
		
		userDAO.attachDirty(user);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "修改成功，重新登录后生效");
		return "msg";
	}
	
	
	public String userLogin()
	{
		String sql="from TUser where userName=? and userPw=?";
		Object[] con={userName,userPw};
		List userList=userDAO.getHibernateTemplate().find(sql,con);
		if(userList.size()==0)
		{
			this.setMessage("学号或密码错误");
			this.setPath("qiantai/default.jsp");
		}
		else
		{
			 Map session= ServletActionContext.getContext().getSession();
			 TUser user=(TUser)userList.get(0);
			 session.put("user", user);
			 session.put("userType", 2);
			 this.setMessage("成功登录");
			 this.setPath("qiantai/default.jsp");
		}
		return "succeed";
	}
	
	
	public String userLogout()
	{
		Map session= ServletActionContext.getContext().getSession();
		session.remove("user");
		session.remove("userType");
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String userMana()
	{
		String sql="from TUser where userDel='no'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<userList.size();i++)
		{
			TUser user=(TUser)userList.get(i);
			user.setLaoshi(laoshiDAO.findById(user.getLaoshiId()));
		}
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	public String userDel()
	{
		TUser user=userDAO.findById(userId);
		user.setUserDel("yes");
		userDAO.attachDirty(user);
		this.setMessage("删除成功");
		this.setPath("userMana.action");
		return "succeed";
	}
	

	public String getUserEmail()
	{
		return userEmail;
	}

	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}

	public String getUserRealname()
	{
		return userRealname;
	}

	public void setUserRealname(String userRealname)
	{
		this.userRealname = userRealname;
	}

	public String getUserSex()
	{
		return userSex;
	}

	public TLaoshiDAO getLaoshiDAO() {
		return laoshiDAO;
	}



	public void setLaoshiDAO(TLaoshiDAO laoshiDAO) {
		this.laoshiDAO = laoshiDAO;
	}



	public void setUserSex(String userSex)
	{
		this.userSex = userSex;
	}

	public String getUserTel()
	{
		return userTel;
	}

	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}


	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public Integer getLaoshiId() {
		return laoshiId;
	}



	public void setLaoshiId(Integer laoshiId) {
		this.laoshiId = laoshiId;
	}



	public String getUserDel() {
		return userDel;
	}



	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}



	public void setUserId(Integer userId) {
		this.userId = userId;
	}



	public TUserDAO getUserDAO()
	{
		return userDAO;
	}



	public String getMessage()
	{
		return message;
	}



	public void setMessage(String message)
	{
		this.message = message;
	}


	public String getPath()
	{
		return path;
	}


	public void setPath(String path)
	{
		this.path = path;
	}


	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}


	public String getUserPw()
	{
		return userPw;
	}

	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}

	
}
