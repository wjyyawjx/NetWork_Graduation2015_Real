package com.yidu.domain;

import java.util.Date;

public class Comment {
    private String commentId;

    private String userId;

    private String toyId;

    private String commentContent;

    private Date commentTime;

    private String commentPhoto;

    private String commentEvaluate;

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId == null ? null : commentId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getToyId() {
        return toyId;
    }

    public void setToyId(String toyId) {
        this.toyId = toyId == null ? null : toyId.trim();
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public String getCommentPhoto() {
        return commentPhoto;
    }

    public void setCommentPhoto(String commentPhoto) {
        this.commentPhoto = commentPhoto == null ? null : commentPhoto.trim();
    }

    public String getCommentEvaluate() {
        return commentEvaluate;
    }

    public void setCommentEvaluate(String commentEvaluate) {
        this.commentEvaluate = commentEvaluate == null ? null : commentEvaluate.trim();
    }
}