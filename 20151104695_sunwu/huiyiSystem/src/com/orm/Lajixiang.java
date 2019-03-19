package com.orm;

public class Lajixiang
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
	private String type;//fa：从已共享删除的。shou：从已接受删除的
	
	
	
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
	public String getFujian()
	{
		return fujian;
	}
	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}
	
	public Yuangong getFromYuangong()
	{
		return fromYuangong;
	}
	public void setFromYuangong(Yuangong fromYuangong)
	{
		this.fromYuangong = fromYuangong;
	}
	public String getFujianYuanshiming()
	{
		return fujianYuanshiming;
	}
	public void setFujianYuanshiming(String fujianYuanshiming)
	{
		this.fujianYuanshiming = fujianYuanshiming;
	}
	public Yuangong getToYuangong()
	{
		return toYuangong;
	}
	public void setToYuangong(Yuangong toYuangong)
	{
		this.toYuangong = toYuangong;
	}
	public int getId()
	{
		return id;
	}
	
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
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
