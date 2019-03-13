package com.yidu.controller.vo;

import java.util.Date;

public class CommentVo {
	
 	private String commentId;

    private String userId;
    
    private String userName;

    private String toyId;
    
    private String toyName;

    private String commentContent;

    private String commentTime;

    private String commentPhoto;

    private String commentEvaluate;

    
    
    
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getToyName() {
		return toyName;
	}

	public void setToyName(String toyName) {
		this.toyName = toyName;
	}

	public String getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getToyId() {
		return toyId;
	}

	public void setToyId(String toyId) {
		this.toyId = toyId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentPhoto() {
		return commentPhoto;
	}

	public void setCommentPhoto(String commentPhoto) {
		this.commentPhoto = commentPhoto;
	}

	public String getCommentEvaluate() {
		return commentEvaluate;
	}

	public void setCommentEvaluate(String commentEvaluate) {
		this.commentEvaluate = commentEvaluate;
	}
    
    
}
