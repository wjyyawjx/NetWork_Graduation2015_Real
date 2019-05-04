package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TUserDAO;
import com.dao.TZiyuanDAO;
import com.model.TUser;
import com.model.TZiyuan;
import com.opensymphony.xwork2.ActionSupport;

public class ziyuanAction extends ActionSupport
{
	private Integer id;
	private String biaoti;
	private String neirong;
	private String fujian;
	private String shijian;
	
	private TZiyuanDAO ziyuanDAO;
	
	
	public String ziyuanAdd()
	{
		TZiyuan ziyuan=new TZiyuan();
		
		ziyuan.setBiaoti(biaoti);
		ziyuan.setNeirong(neirong);
		ziyuan.setFujian(fujian);
		ziyuan.setShijian(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		
		ziyuanDAO.save(ziyuan);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息添加成功");
		return "msg";
	}
	
	public String ziyuanMana()
	{
		String sql="from TZiyuan";
		List ziyuanList=ziyuanDAO.getHibernateTemplate().find(sql);

		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("ziyuanList", ziyuanList);
		return ActionSupport.SUCCESS;
	}
	
	public String ziyuanDel()
	{
		
		TZiyuan ziyuan=ziyuanDAO.findById(id);
		ziyuanDAO.delete(ziyuan);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息删除成功");
		return "msg";
	}

	
	public String ziyuanAll()
	{
		String sql="from TZiyuan";
		List ziyuanList=ziyuanDAO.getHibernateTemplate().find(sql);

		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("ziyuanList", ziyuanList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String ziyuanDetailQian()
	{
		
		TZiyuan ziyuan=ziyuanDAO.findById(id);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("ziyuan", ziyuan);
		return ActionSupport.SUCCESS;
	}
	
	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getBiaoti()
	{
		return biaoti;
	}

	public void setBiaoti(String biaoti)
	{
		this.biaoti = biaoti;
	}

	public String getNeirong()
	{
		return neirong;
	}

	public void setNeirong(String neirong)
	{
		this.neirong = neirong;
	}

	public String getFujian()
	{
		return fujian;
	}

	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

	public String getShijian()
	{
		return shijian;
	}

	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}

	public TZiyuanDAO getZiyuanDAO()
	{
		return ziyuanDAO;
	}

	public void setZiyuanDAO(TZiyuanDAO ziyuanDAO)
	{
		this.ziyuanDAO = ziyuanDAO;
	}
	
}
