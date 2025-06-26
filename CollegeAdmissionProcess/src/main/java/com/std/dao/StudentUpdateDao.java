package com.std.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.std.entity.Address;
import com.std.entity.Student;

@Repository
public class StudentUpdateDao {

	@Autowired
	JdbcTemplate template;

	@SuppressWarnings("deprecation")
	public Student findStudentByUserId(String userId) {
		String sql = "SELECT * FROM student WHERE userid = ?";
		try {
			return template.queryForObject(sql, new Object[] { userId }, new BeanPropertyRowMapper<>(Student.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public boolean updateStudentByUserId(Student student) {
		String sql = "UPDATE student SET firstname=?, middelname=?, lastname=?, email=?, dob=?, gender=?, bloodgroup=?, mothername=?, aadhaarno=?, mobileno=? WHERE userid=?";
		int result = template.update(sql, student.getFirstname(), student.getMiddelname(), student.getLastname(),
				student.getEmail(), student.getDob(), student.getGender(), student.getBloodgroup(),
				student.getMothername(), student.getAadhaarno(), student.getMobileno(), student.getUserid());
		return result > 0;
	}

	// address update

	@SuppressWarnings("deprecation")
	public Address getAddressByUserId(String userId) {
		String sql = "SELECT * FROM address_details WHERE userid = ?";
		try {
			return template.queryForObject(sql, new Object[] { userId }, new BeanPropertyRowMapper<>(Address.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public boolean updateAddressByUserId(Address address) {
		String sql = "UPDATE address_details SET current_address=?, current_village=?, tahsil=?, currentdistrict=?, state=?, country=?, pincode=? WHERE userid=?";

		int result = template.update(sql, address.getCurrentAddress(), address.getCurrentVillage(), address.getTahsil(),
				address.getCurrentDistrict(), address.getState(), address.getCountry(), address.getPincode(),
				address.getUserid());

		return result > 0; // If at least one row is updated, return true
	}
}
