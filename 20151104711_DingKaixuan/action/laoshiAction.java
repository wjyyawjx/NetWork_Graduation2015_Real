package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TLaoshiDAO;
import com.model.TLaoshi;
import com.opensymphony.xwork2.ActionSupport;

public class laoshiAction extends ActionSupport
{
	private Integer id;
	private String bianhao;
	private String xingming;
	private String xingbie;

	private String nianling;
	private String loginpw;
	private String del;
	
	private TLaoshiDAO laoshiDAO;
	
	
	public String laoshiAdd()
	{
		TLaoshi laoshi=new TLaoshi();
		
		laoshi.setBianhao(bianhao);
		laoshi.setXingming(xingming);
		laoshi.setXingbie(xingbie);
		laoshi.setNianling(nianling);
		
		laoshi.setLoginpw(loginpw);
		laoshi.setDel("no");
		
		
		laoshiDAO.save(laoshi);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息添加成功");
		return "msg";
	}
	
	public String laoshiMana()
	{
		String sql="from TLaoshi where del='no'";
		List laoshiList=laoshiDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("laoshiList", laoshiList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String laoshiDel()
	{
		
		TLaoshi laoshi=laoshiDAO.findById(id);
		laoshi.setDel("yes");
		laoshiDAO.attachDirty(laoshi);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息删除成功");
		return "msg";
	}
	
	public String laoshiPre()
	{
		
		TLaoshi laoshi=laoshiDAO.findById(id);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("laoshi", laoshi);
		return ActionSupport.SUCCESS;
	}
	
	
	public String laoshiEdit()
	{
		
        TLaoshi laoshi=laoshiDAO.findById(id);
		
		laoshi.setBianhao(bianhao);
		laoshi.setXingming(xingming);
		laoshi.setXingbie(xingbie);
		laoshi.setNianling(nianling);
		
		laoshi.setLoginpw(loginpw);
		
		laoshiDAO.attachDirty(laoshi);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息修改成功");
		return "msg";
	}
	
	
	public String laoshiAll()
	{
		String sql="from TLaoshi where del='no'";
		List laoshiList=laoshiDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("laoshiList", laoshiList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String laoshiEditMe()
	{
		
		TLaoshi laoshi=laoshiDAO.findById(id);
		
		laoshi.setBianhao(bianhao);
		laoshi.setXingming(xingming);
		laoshi.setXingbie(xingbie);
		laoshi.setNianling(nianling);
		
		laoshi.setLoginpw(loginpw);
		
		laoshiDAO.attachDirty(laoshi);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息修改成功，重新登录后生效");
		return "msg";
	}

	public String getBianhao()
	{
		return bianhao;
	}

	public void setBianhao(String bianhao)
	{
		this.bianhao = bianhao;
	}

	public String getDel()
	{
		return del;
	}

	public void setDel(String del)
	{
		this.del = del;
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public TLaoshiDAO getLaoshiDAO()
	{
		return laoshiDAO;
	}

	public void setLaoshiDAO(TLaoshiDAO laoshiDAO)
	{
		this.laoshiDAO = laoshiDAO;
	}

	public String getLoginpw()
	{
		return loginpw;
	}

	public void setLoginpw(String loginpw)
	{
		this.loginpw = loginpw;
	}

	public String getNianling()
	{
		return nianling;
	}

	public void setNianling(String nianling)
	{
		this.nianling = nianling;
	}

	public String getXingbie()
	{
		return xingbie;
	}

	public void setXingbie(String xingbie)
	{
		this.xingbie = xingbie;
	}

	public String getXingming()
	{
		return xingming;
	}

	public void setXingming(String xingming)
	{
		this.xingming = xingming;
	}
	
}
