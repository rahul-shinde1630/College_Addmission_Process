package com.std.entity;

public class Student {
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

	public Student() {

	}

	public Student(String firstname, String middelname, String lastname, String email, String dob, String gender,
			String bloodgroup, String mothername, String aadhaarno, String mobileno) {
		super();

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

	public String getStudentId() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setAdmission_status(String string) {
		// TODO Auto-generated method stub

	}

}
