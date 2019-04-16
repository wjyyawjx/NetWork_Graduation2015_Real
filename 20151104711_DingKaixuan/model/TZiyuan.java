package com.model;

/**
 * TZiyuan entity. @author MyEclipse Persistence Tools
 */

public class TZiyuan implements java.io.Serializable
{

	// Fields

	private Integer id;
	private String biaoti;
	private String neirong;
	private String fujian;
	private String shijian;

	// Constructors

	/** default constructor */
	public TZiyuan()
	{
	}

	/** full constructor */
	public TZiyuan(String biaoti, String neirong, String fujian, String shijian)
	{
		this.biaoti = biaoti;
		this.neirong = neirong;
		this.fujian = fujian;
		this.shijian = shijian;
	}

	// Property accessors

	public Integer getId()
	{
		return this.id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getBiaoti()
	{
		return this.biaoti;
	}

	public void setBiaoti(String biaoti)
	{
		this.biaoti = biaoti;
	}

	public String getNeirong()
	{
		return this.neirong;
	}

	public void setNeirong(String neirong)
	{
		this.neirong = neirong;
	}

	public String getFujian()
	{
		return this.fujian;
	}

	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

	public String getShijian()
	{
		return this.shijian;
	}

	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}

}