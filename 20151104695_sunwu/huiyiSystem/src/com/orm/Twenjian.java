package com.orm;

public class Twenjian
{
	private int id;
	private String mingcheng;
	private String fujian;
	private String fujianYuanshiming;
	private String shuoming;
	private String shijian;
	private int yuangong_id;
	
	private Yuangong yuangong;
	
	public String getFujian()
	{
		return fujian;
	}
	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}
	public String getFujianYuanshiming()
	{
		return fujianYuanshiming;
	}
	public void setFujianYuanshiming(String fujianYuanshiming)
	{
		this.fujianYuanshiming = fujianYuanshiming;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getMingcheng()
	{
		return mingcheng;
	}
	
	public Yuangong getYuangong()
	{
		return yuangong;
	}
	public void setYuangong(Yuangong yuangong)
	{
		this.yuangong = yuangong;
	}
	public int getYuangong_id()
	{
		return yuangong_id;
	}
	public void setYuangong_id(int yuangong_id)
	{
		this.yuangong_id = yuangong_id;
	}
	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}
	public String getShijian()
	{
		return shijian;
	}
	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}
	public String getShuoming()
	{
		return shuoming;
	}
	public void setShuoming(String shuoming)
	{
		this.shuoming = shuoming;
	}
}
