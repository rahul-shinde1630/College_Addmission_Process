package com.std.admindao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.std.entity.Students;

@Repository
public class AdminProfileDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings("deprecation")
	public Students getStudentByUserId(int id) {
		String sql = "SELECT s.*, d.photo_path FROM student s "
				+ "LEFT JOIN student_documents d ON s.userid = d.userid " + "WHERE s.id = ?";

		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new RowMapper<Students>() {
			@Override
			public Students mapRow(ResultSet rs, int rowNum) throws SQLException {
				Students student = new Students();
				student.setId(rs.getInt("id"));
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
				student.setAdmission_status(rs.getString("admission_status"));
				student.setPhoto_path(rs.getString("photo_path")); // from student_documents
				System.out.println("Photo file: " + student.getPhoto_path());

				return student;
			}
		});
	}

}
