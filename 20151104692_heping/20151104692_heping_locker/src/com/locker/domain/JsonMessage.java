package com.locker.domain;

public class JsonMessage {
	private int state ; //״̬0��ʾʧ��  1 ��ʾ�ɹ�
	private String msg ; //������Ϣ
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
