
package cn.chat.pojo;

public class UserBeanVo {
	private int userid;
	private int count; 
	private String status; 
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCount() {
		return count;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
