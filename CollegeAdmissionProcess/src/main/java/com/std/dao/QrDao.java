package com.std.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.std.entity.Student;

@Repository
public class QrDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@SuppressWarnings("deprecation")
	public Student getStudentByUserId(String userid) {
		String sql = "SELECT * FROM student WHERE userid = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { userid }, new RowMapper<Student>() {
				@Override
				public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
					Student student = new Student();
					student.setUserid(rs.getString("userid"));
					student.setFirstname(rs.getString("firstname"));
					student.setMiddelname(rs.getString("middelname"));
					student.setLastname(rs.getString("lastname"));
					student.setEmail(rs.getString("email"));
					student.setDob(rs.getString("dob"));
					student.setGender(rs.getString("gender"));
					student.setBloodgroup(rs.getString("bloodgroup"));
					student.setMothername(rs.getString("mothername"));
					student.setAadhaarno(rs.getString("aadhaarno"));
					student.setMobileno(rs.getString("mobileno"));
					return student;
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
