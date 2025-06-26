package com.std.userdao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	@Autowired
	JdbcTemplate template;

	public boolean signUpStudent(String userid, String email, String password) {
		Object[] args = { userid, email, password };

		int result = template.update("insert into user (userid,email,password) values(?,?,?)", args);

		if (result == 1) {
			return true;
		} else {
			return false;
		}

	}

	public boolean loginStudent(String userid, String email, String password) {
		Object[] args = { userid, email, password };
		int rs = template.queryForObject("SELECT COUNT(*) FROM user WHERE userid = ? AND email = ? AND password = ?",
				Integer.class, args);

		if (rs == 1) {
			return true;
		} else {
			return false;
		}
	}

	@SuppressWarnings("deprecation")
	public String getAdmissionStatus(String userid) {
		try {
			String sql = "SELECT admission_status FROM student WHERE userid = ?";
			return template.queryForObject(sql, new Object[] { userid }, String.class);
		} catch (Exception e) {
			e.printStackTrace();
			return "PENDING";
		}
	}

}
