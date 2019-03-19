package com.orm;

public class Shoujianxiang
{
	private int id;
	private String title;
	private String content;
	private String fujian;
	private String fujianYuanshiming;
	private String shijian;
	private int from_yuangong_id;
	private int to_yuangong_id;
	
	private Yuangong fromYuangong;
	private Yuangong toYuangong;
	
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public int getFrom_yuangong_id()
	{
		return from_yuangong_id;
	}
	public void setFrom_yuangong_id(int from_yuangong_id)
	{
		this.from_yuangong_id = from_yuangong_id;
	}
	
	public Yuangong getFromYuangong()
	{
		return fromYuangong;
	}
	public void setFromYuangong(Yuangong fromYuangong)
	{
		this.fromYuangong = fromYuangong;
	}
	public Yuangong getToYuangong()
	{
		return toYuangong;
	}
	public void setToYuangong(Yuangong toYuangong)
	{
		this.toYuangong = toYuangong;
	}
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
	public String getShijian()
	{
		return shijian;
	}
	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public int getTo_yuangong_id()
	{
		return to_yuangong_id;
	}
	public void setTo_yuangong_id(int to_yuangong_id)
	{
		this.to_yuangong_id = to_yuangong_id;
	}

}
