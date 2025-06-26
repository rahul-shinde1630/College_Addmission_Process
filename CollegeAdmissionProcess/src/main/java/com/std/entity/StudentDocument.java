package com.std.entity;

public class StudentDocument {

	private String userid;
	private String aadharPath;
	private String marksheetPath;
	private String tcPath;
	private String photoPath;
	private String status; // add getter & setter

	public StudentDocument() {
		// TODO Auto-generated constructor stub
	}

	public StudentDocument(String userid, String aadharPath, String marksheetPath, String tcPath, String photoPath,
			String status) {
		super();
		this.userid = userid;
		this.aadharPath = aadharPath;
		this.marksheetPath = marksheetPath;
		this.tcPath = tcPath;
		this.photoPath = photoPath;
		this.status = status;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAadharPath() {
		return aadharPath;
	}

	public void setAadharPath(String aadharPath) {
		this.aadharPath = aadharPath;
	}

	public String getMarksheetPath() {
		return marksheetPath;
	}

	public void setMarksheetPath(String marksheetPath) {
		this.marksheetPath = marksheetPath;
	}

	public String getTcPath() {
		return tcPath;
	}

	public void setTcPath(String tcPath) {
		this.tcPath = tcPath;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
