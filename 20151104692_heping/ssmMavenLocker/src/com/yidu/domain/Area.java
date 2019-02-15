package com.yidu.domain;
/**
 * 地区表
 * @author wuqi
 *
 */
public class Area {
	/**
	 * 地区编号
	 */
    private String arId;

    /**
     * 地区名
     */
    private String arName;

    public String getArId() {
        return arId;
    }

    public void setArId(String arId) {
        this.arId = arId == null ? null : arId.trim();
    }

    public String getArName() {
        return arName;
    }

    public void setArName(String arName) {
        this.arName = arName == null ? null : arName.trim();
    }
}