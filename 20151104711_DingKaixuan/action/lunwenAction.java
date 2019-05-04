package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.TLunwenDAO;
import com.dao.TUserDAO;
import com.model.TLaoshi;
import com.model.TLunwen;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class lunwenAction extends ActionSupport
{
	private Integer id;
	private String mingcheng;
	private String fujian;
	private String tijiaoshi;
	
	private String yishenjieguo;
	private String yishenyijian;
	private Integer userId;
	
	private String message;
	private String path;
	
	private TLunwenDAO lunwenDAO;
	private TUserDAO userDAO;
	
	public String lunwenAdd()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		TUser user=(TUser)session.getAttribute("user");
		
		TLunwen lunwen=new TLunwen();
		
		//lunwen.setId(id);
		lunwen.setMingcheng(mingcheng);
		lunwen.setFujian(fujian);
		lunwen.setTijiaoshi(tijiaoshi);
		
		lunwen.setYishenjieguo("待审核");
		lunwen.setYishenyijian("");
		lunwen.setUserId(user.getUserId());
		
		lunwenDAO.save(lunwen);
		
		this.setMessage("提交成功");
		this.setPath("index.action");
		return "succeed";
	}
	
	
	public String lunwenMine()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		TUser user=(TUser)session.getAttribute("user");
		
		String sql="from TLunwen where userId="+user.getUserId();
		List lunwenList =lunwenDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<lunwenList.size();i++)
		{
			TLunwen lunwen=(TLunwen)lunwenList.get(i);
			lunwen.setUser(userDAO.findById(lunwen.getUserId()));
		}
		
		request.setAttribute("lunwenList", lunwenList);
		return ActionSupport.SUCCESS;
	}
	
	public String lunwenDel()
	{
		TLunwen lunwen=lunwenDAO.findById(id);
		lunwenDAO.delete(lunwen);
		
		this.setMessage("删除成功");
		this.setPath("index.action");
		return "succeed";
	}
	
	
	public String lunwenMana()//老师审核论文
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		List lunwenList=new ArrayList();
		TLaoshi laoshi=(TLaoshi)session.getAttribute("laoshi");
		
		String sql="from TLunwen";
		List lunwenList1 =lunwenDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<lunwenList1.size();i++)
		{
			TLunwen lunwen=(TLunwen)lunwenList1.get(i);
			lunwen.setUser(userDAO.findById(lunwen.getUserId()));
			int a=laoshi.getId();
			int b=lunwen.getUser().getLaoshiId();
			
			if(a==b)
			{
				lunwenList.add(lunwen);
			}
		}
		
		request.setAttribute("lunwenList", lunwenList);
		return ActionSupport.SUCCESS;
	}
	
	public String lunwenDelLaoshi()
	{
		TLunwen lunwen=lunwenDAO.findById(id);
		lunwenDAO.delete(lunwen);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	public String yishenGengxin()
	{
		TLunwen lunwen=lunwenDAO.findById(id);
		lunwen.setYishenjieguo(yishenjieguo);
		lunwen.setYishenyijian(yishenyijian);
		lunwenDAO.attachDirty(lunwen);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "审核完毕");
		return "msg";
	}
	
	public String lunwenMana0()//管理员查看论文
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		String sql="from TLunwen where yishenjieguo='审核通过'";
		List lunwenList =lunwenDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<lunwenList.size();i++)
		{
			TLunwen lunwen=(TLunwen)lunwenList.get(i);
			lunwen.setUser(userDAO.findById(lunwen.getUserId()));
		}
		request.setAttribute("lunwenList", lunwenList);
		return ActionSupport.SUCCESS;
	}



	public String getYishenjieguo() {
		return yishenjieguo;
	}


	public void setYishenjieguo(String yishenjieguo) {
		this.yishenjieguo = yishenjieguo;
	}


	public String getYishenyijian() {
		return yishenyijian;
	}


	public void setYishenyijian(String yishenyijian) {
		this.yishenyijian = yishenyijian;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getMingcheng() {
		return mingcheng;
	}


	public TUserDAO getUserDAO() {
		return userDAO;
	}


	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}


	public String getTijiaoshi() {
		return tijiaoshi;
	}


	public void setTijiaoshi(String tijiaoshi) {
		this.tijiaoshi = tijiaoshi;
	}


	public void setMingcheng(String mingcheng) {
		this.mingcheng = mingcheng;
	}


	public String getFujian() {
		return fujian;
	}


	public void setFujian(String fujian) {
		this.fujian = fujian;
	}





	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}


	public TLunwenDAO getLunwenDAO() {
		return lunwenDAO;
	}


	public void setLunwenDAO(TLunwenDAO lunwenDAO) {
		this.lunwenDAO = lunwenDAO;
	}

	
}
