package com.std.entity;

public class Profile {
	private String userid;
	private String firstname;
	private String middlename;
	private String lastname;
	private String email;
	private String dob;
	private String gender;
	private String mobileno;

	private String currentAddress;
	private String currentVillage;
	private String tahsil;
	private String currentDistrict;
	private String state;
	private String pincode;
	private String country;

	private byte[] photopath;

	public Profile() {
		// TODO Auto-generated constructor stub
	}

	public Profile(String userid, String firstname, String middlename, String lastname, String email, String dob,
			String gender, String mobileno, String currentAddress, String currentVillage, String tahsil,
			String currentDistrict, String state, String pincode, String country, byte[] photopath) {
		super();
		this.userid = userid;
		this.firstname = firstname;
		this.middlename = middlename;
		this.lastname = lastname;
		this.email = email;
		this.dob = dob;
		this.gender = gender;
		this.mobileno = mobileno;
		this.currentAddress = currentAddress;
		this.currentVillage = currentVillage;
		this.tahsil = tahsil;
		this.currentDistrict = currentDistrict;
		this.state = state;
		this.pincode = pincode;
		this.country = country;
		this.photopath = photopath;
	}
	// Getters and setters

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getMiddlename() {
		return middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
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

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public byte[] getPhotopath() {
		return photopath;
	}

	public void setPhotopath(byte[] photopath) {
		this.photopath = photopath;
	}

}
