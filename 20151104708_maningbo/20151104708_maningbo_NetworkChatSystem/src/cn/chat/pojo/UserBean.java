
package cn.chat.pojo;

import java.util.List;

public class UserBean {
	private int id;
	private String userName;
	private String userPass;
	private String gender;
	private String phone;
	private String birthDay;
	private int flag;
	
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	private List<UserBeanVo> listVo;
	public String getBirthDay() {
		return birthDay;
	}
	public List<UserBeanVo> getListVo() {
		return listVo;
	}
	public void setListVo(List<UserBeanVo> listVo) {
		this.listVo = listVo;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	private String email;
	private String image;
	private String role;
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	
}
