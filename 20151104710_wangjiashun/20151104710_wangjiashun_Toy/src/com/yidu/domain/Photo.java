package com.yidu.domain;

public class Photo {
    private String photoId;

    private String photoPath;
    private String photoRemark;
    public String getPhotoId() {
        return photoId;
    }

    public void setPhotoId(String photoId) {
        this.photoId = photoId == null ? null : photoId.trim();
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath == null ? null : photoPath.trim();
    }
    public String getPhotoRemark() {
        return photoRemark;
    }

    public void setPhotoRemark(String photoRemark) {
        this.photoRemark = photoRemark == null ? null : photoRemark.trim();
    }
    
}