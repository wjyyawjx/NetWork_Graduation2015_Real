package com.imnu.model;

public class AuImage {
    private String imId;

    private String comId;

    private String imUpload;

    private String imType;
    
    private String comName;

    public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public String getImId() {
        return imId;
    }

    public void setImId(String imId) {
        this.imId = imId == null ? null : imId.trim();
    }

    public String getComId() {
        return comId;
    }

    public void setComId(String comId) {
        this.comId = comId == null ? null : comId.trim();
    }

    public String getImUpload() {
        return imUpload;
    }

    public void setImUpload(String imUpload) {
        this.imUpload = imUpload == null ? null : imUpload.trim();
    }

    public String getImType() {
        return imType;
    }

    public void setImType(String imType) {
        this.imType = imType == null ? null : imType.trim();
    }
}