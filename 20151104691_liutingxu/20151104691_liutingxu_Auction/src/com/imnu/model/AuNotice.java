package com.imnu.model;


/**
 * 标题表
 * @author asus
 *
 */
public class AuNotice {
    private String noId;

    private String noTitle;

    private String noContent;

    public String getNoId() {
        return noId;
    }

    public void setNoId(String noId) {
        this.noId = noId == null ? null : noId.trim();
    }

    public String getNoTitle() {
        return noTitle;
    }

    public void setNoTitle(String noTitle) {
        this.noTitle = noTitle == null ? null : noTitle.trim();
    }

    public String getNoContent() {
        return noContent;
    }

    public void setNoContent(String noContent) {
        this.noContent = noContent == null ? null : noContent.trim();
    }
}