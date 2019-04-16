package cn.edu.imnu.po;

public class Plan {
	private static final long serialVersionUID = 1L;
	private Integer p_id; // 植物id
	private String p_name;// 植物名字
	private String p_breeding; // 繁殖方式
	private Integer p_habits; // 习性
	private String p_place; // 分布
	private String p_form; //形态特征
	private String p_img; // 图片
	private String p_water; // 浇水频率
	private String p_message; // 植物培养描述
	private Integer u_id; // 上传用户id

	public String getP_water() {
		return p_water;
	}

	public void setP_water(String p_water) {
		this.p_water = p_water;
	}

	public String getP_message() {
		return p_message;
	}

	public void setP_message(String p_message) {
		this.p_message = p_message;
	}

	public Integer getP_id() {
		return p_id;
	}

	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_breeding() {
		return p_breeding;
	}

	public void setP_breeding(String p_breeding) {
		this.p_breeding = p_breeding;
	}

	public Integer getP_habits() {
		return p_habits;
	}

	public void setP_habits(Integer p_habits) {
		this.p_habits = p_habits;
	}

	public String getP_place() {
		return p_place;
	}

	public void setP_place(String p_place) {
		this.p_place = p_place;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public String getP_form() {
		return p_form;
	}

	public void setP_form(String p_form) {
		this.p_form = p_form;
	}
}
