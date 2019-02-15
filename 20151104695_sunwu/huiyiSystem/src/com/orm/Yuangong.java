package com.orm;

public class Yuangong
{
	private int id;
	private int org_id;
	private String bianhao;
	private String name;
	
	private String sex;
	private String quanxian;
	private String loginname;
	private String loginpw;
	private String del;
	
	private TOrganization organization;
	
	
	public String getBianhao()
	{
		return bianhao;
	}
	public void setBianhao(String bianhao)
	{
		this.bianhao = bianhao;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	
	public String getQuanxian()
	{
		return quanxian;
	}
	public void setQuanxian(String quanxian)
	{
		this.quanxian = quanxian;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getSex()
	{
		return sex;
	}
	
	public String getLoginname()
	{
		return loginname;
	}
	public void setLoginname(String loginname)
	{
		this.loginname = loginname;
	}
	public String getLoginpw()
	{
		return loginpw;
	}
	public void setLoginpw(String loginpw)
	{
		this.loginpw = loginpw;
	}
	public void setSex(String sex)
	{
		this.sex = sex;
	}
	public String getDel()
	{
		return del;
	}
	public void setDel(String del)
	{
		this.del = del;
	}
	public int getOrg_id()
	{
		return org_id;
	}
	public void setOrg_id(int org_id)
	{
		this.org_id = org_id;
	}
	public TOrganization getOrganization()
	{
		return organization;
	}
	public void setOrganization(TOrganization organization)
	{
		this.organization = organization;
	}
	
	
	
}
