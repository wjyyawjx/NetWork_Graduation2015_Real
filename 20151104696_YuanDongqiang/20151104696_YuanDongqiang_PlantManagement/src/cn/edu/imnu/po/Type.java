package cn.edu.imnu.po;

public class Type {
	private static final long serialVersionUID = 1L;
	private String name;// 内容类型
	private Integer t_id;// 类型id
	private String t_name;// 类型名称

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getT_id() {
		return t_id;
	}

	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
