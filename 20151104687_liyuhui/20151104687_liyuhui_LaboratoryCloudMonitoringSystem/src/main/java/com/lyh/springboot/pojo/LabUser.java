package com.lyh.springboot.pojo;

import java.io.Serializable;

public class LabUser implements Serializable {
    private Integer id;

    private Long uId;

    private Integer lId;

    private String uType;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getuId() {
        return uId;
    }

    public void setuId(Long uId) {
        this.uId = uId;
    }

    public Integer getlId() {
        return lId;
    }

    public void setlId(Integer lId) {
        this.lId = lId;
    }

    public String getuType() {
        return uType;
    }

    public void setuType(String uType) {
        this.uType = uType == null ? null : uType.trim();
    }

}