package com.std.entity;

public class EducationalDetails {

	private Double tenthMarks;
	private String tenthBoard;
	private Integer tenthYear;
	private Double twelfthMarks;
	private String twelfthBoard;
	private Integer twelfthYear;
	private String course;
	private String studyMode;
	private String admissionYear;

	public EducationalDetails() {
		// TODO Auto-generated constructor stub
	}

	public EducationalDetails(Double tenthMarks, String tenthBoard, Integer tenthYear, Double twelfthMarks,
			String twelfthBoard, Integer twelfthYear, String course, String studyMode, String admissionYear) {
		super();

		this.tenthMarks = tenthMarks;
		this.tenthBoard = tenthBoard;
		this.tenthYear = tenthYear;
		this.twelfthMarks = twelfthMarks;
		this.twelfthBoard = twelfthBoard;
		this.twelfthYear = twelfthYear;
		this.course = course;
		this.studyMode = studyMode;
		this.admissionYear = admissionYear;
	}

	public Double getTenthMarks() {
		return tenthMarks;
	}

	public void setTenthMarks(Double tenthMarks) {
		this.tenthMarks = tenthMarks;
	}

	public String getTenthBoard() {
		return tenthBoard;
	}

	public void setTenthBoard(String tenthBoard) {
		this.tenthBoard = tenthBoard;
	}

	public Integer getTenthYear() {
		return tenthYear;
	}

	public void setTenthYear(Integer tenthYear) {
		this.tenthYear = tenthYear;
	}

	public Double getTwelfthMarks() {
		return twelfthMarks;
	}

	public void setTwelfthMarks(Double twelfthMarks) {
		this.twelfthMarks = twelfthMarks;
	}

	public String getTwelfthBoard() {
		return twelfthBoard;
	}

	public void setTwelfthBoard(String twelfthBoard) {
		this.twelfthBoard = twelfthBoard;
	}

	public Integer getTwelfthYear() {
		return twelfthYear;
	}

	public void setTwelfthYear(Integer twelfthYear) {
		this.twelfthYear = twelfthYear;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getStudyMode() {
		return studyMode;
	}

	public void setStudyMode(String studyMode) {
		this.studyMode = studyMode;
	}

	public String getAdmissionYear() {
		return admissionYear;
	}

	public void setAdmissionYear(String admissionYear) {
		this.admissionYear = admissionYear;
	}

}
