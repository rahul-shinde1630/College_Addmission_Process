package com.std.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.std.entity.Student;
import com.std.entity.StudentDocument;
import com.std.entity.Students;

@Repository
public class ProfileDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	// Fetch student details by userId
	@SuppressWarnings("deprecation")
	public Student getStudentByUserId(String userId) {
		String query = "SELECT * FROM student WHERE userid = ?";
		return jdbcTemplate.queryForObject(query, new Object[] { userId }, new RowMapper<Student>() {
			@Override
			public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
				Student student = new Student();
				student.setUserid(rs.getString("userid"));
				student.setFirstname(rs.getString("firstname"));
				student.setMiddelname(rs.getString("middelname"));
				student.setLastname(rs.getString("lastname"));
				student.setEmail(rs.getString("email"));
				student.setMobileno(rs.getString("mobileno"));
				student.setDob(rs.getString("dob"));
				student.setGender(rs.getString("gender"));
				student.setBloodgroup(rs.getString("bloodgroup"));
				student.setMothername(rs.getString("mothername"));
				student.setAadhaarno(rs.getString("aadhaarno"));
				// Populate other student fields as needed
				return student;
			}
		});
	}

	@SuppressWarnings("deprecation")
	public StudentDocument getDocumentByUserId(String userId) {
		String query = "SELECT userid, photo_path FROM student_documents WHERE userid = ?";
		return jdbcTemplate.queryForObject(query, new Object[] { userId }, new RowMapper<StudentDocument>() {
			@Override
			public StudentDocument mapRow(ResultSet rs, int rowNum) throws SQLException {
				StudentDocument document = new StudentDocument();
				document.setUserid(rs.getString("userid"));
				document.setPhotoPath(rs.getString("photo_path"));
				return document;
			}
		});
	}

}
