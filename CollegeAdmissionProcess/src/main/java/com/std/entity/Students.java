package com.std.entity;

public class Students {
	private int id;
	private String userid;
	private String firstname;
	private String middelname;
	private String lastname;
	private String email;
	private String dob;
	private String gender;
	private String bloodgroup;
	private String mothername;
	private String aadhaarno;
	private String mobileno;
	private String photo_path;
	private String admission_status;

	public Students() {
		// TODO Auto-generated constructor stub
	}

	public Students(int id, String userid, String firstname, String middelname, String lastname, String email,
			String dob, String gender, String bloodgroup, String mothername, String aadhaarno, String mobileno,
			String photo_path, String admission_status) {
		super();
		this.id = id;
		this.userid = userid;
		this.firstname = firstname;
		this.middelname = middelname;
		this.lastname = lastname;
		this.email = email;
		this.dob = dob;
		this.gender = gender;
		this.bloodgroup = bloodgroup;
		this.mothername = mothername;
		this.aadhaarno = aadhaarno;
		this.mobileno = mobileno;
		this.photo_path = photo_path;
		this.admission_status = admission_status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public String getMiddelname() {
		return middelname;
	}

	public void setMiddelname(String middelname) {
		this.middelname = middelname;
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

	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	public String getMothername() {
		return mothername;
	}

	public void setMothername(String mothername) {
		this.mothername = mothername;
	}

	public String getAadhaarno() {
		return aadhaarno;
	}

	public void setAadhaarno(String aadhaarno) {
		this.aadhaarno = aadhaarno;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getPhoto_path() {
		return photo_path;
	}

	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}

	public String getAdmission_status() {
		return admission_status;
	}

	public void setAdmission_status(String admission_status) {
		this.admission_status = admission_status;
	}

}