package com.std.entity;

public class Address {

	private String currentAddress;
	private String currentVillage;
	private String tahsil;
	private String currentDistrict;
	private String state;
	private String country;
	private int pincode;
	private String userid;

	// Constructors
	public Address() {
	}

	public Address(String currentAddress, String currentVillage, String tahsil, String currentDistrict, String state,
			String country, int pincode) {
		this.currentAddress = currentAddress;
		this.currentVillage = currentVillage;
		this.tahsil = tahsil;
		this.currentDistrict = currentDistrict;
		this.state = state;
		this.country = country;
		this.pincode = pincode;
	}

	public String getCurrentAddress() {
		return currentAddress;
	}

	public void setCurrentAddress(String currentAddress) {
		this.currentAddress = currentAddress;
	}

	public String getCurrentVillage() {
		return currentVillage;
	}

	public void setCurrentVillage(String currentVillage) {
		this.currentVillage = currentVillage;
	}

	public String getTahsil() {
		return tahsil;
	}

	public void setTahsil(String tahsil) {
		this.tahsil = tahsil;
	}

	public String getCurrentDistrict() {
		return currentDistrict;
	}

	public void setCurrentDistrict(String currentDistrict) {
		this.currentDistrict = currentDistrict;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}
