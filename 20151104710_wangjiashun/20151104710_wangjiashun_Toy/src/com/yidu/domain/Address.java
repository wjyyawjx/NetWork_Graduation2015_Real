package com.yidu.domain;

public class Address {
	private String userName;
	
    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName == null ? null : userName.trim();;
	}
	
	private String addressPeople;
	
	private String addressId;

    private String userId;

    private String addressName;

    private String addressDetails;

    private String addressPhoto;

   
    public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }
    public String getAddressPeople() {
        return addressPeople;
    }

    public void setAddressPeople(String addressPeople) {
        this.addressPeople = addressPeople == null ? null : addressPeople.trim();
    }
    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName == null ? null : addressName.trim();
    }

    public String getAddressDetails() {
        return addressDetails;
    }

    public void setAddressDetails(String addressDetails) {
        this.addressDetails = addressDetails == null ? null : addressDetails.trim();
    }

    public String getAddressPhoto() {
        return addressPhoto;
    }

    public void setAddressPhoto(String addressPhoto) {
        this.addressPhoto = addressPhoto == null ? null : addressPhoto.trim();
    }
}