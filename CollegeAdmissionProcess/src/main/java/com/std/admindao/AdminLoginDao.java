package com.std.admindao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.std.entity.Students;

@Repository
public class AdminLoginDao {
	@Autowired
	JdbcTemplate template;

	public boolean adminlogin(String username, String role, String password) {
		Object[] args = { username, role, password };

		int result = template.update("insert into adminlogin (username,role,password) values(?,?,?)", args);

		if (result == 1) {
			return true;
		} else {
			return false;
		}

	}

	public boolean loginAdmin(String username, String role, String password) {
		Object[] args = { username, role, password };
		int rs = template.queryForObject(
				"SELECT COUNT(*) FROM adminlogin WHERE username = ? AND role = ? AND password = ?", Integer.class,
				args);

		if (rs == 1) {
			return true;
		} else {
			return false;
		}
	}

	public List<Students> getAllStudents() {
		String sql = "SELECT * FROM student";

		return template.query(sql, (rs, rowNum) -> {
			Students student = new Students();
			student.setId(rs.getInt("id"));
			student.setFirstname(rs.getString("firstname"));
			student.setLastname(rs.getString("lastname"));
			student.setMiddelname(rs.getString("middelname"));
			student.setEmail(rs.getString("email"));
			student.setMobileno(rs.getString("mobileno"));
			student.setGender(rs.getString("gender"));

			student.setAadhaarno(rs.getString("aadhaarno"));
			return student;
		});
	}

	public boolean deleteStudentByid(int id) {
		int rs = template.update("delete from student where id = ? ", id);

		if (rs == 1) {
			return true;
		} else {
			return false;
		}
	}
}