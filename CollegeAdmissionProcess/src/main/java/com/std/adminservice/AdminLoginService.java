package com.std.adminservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.admindao.AdminLoginDao;
import com.std.entity.Students;

@Service
public class AdminLoginService {

	@Autowired
	AdminLoginDao ad;

	// add new admin
	public boolean adminlogin(String username, String role, String password) {

		return ad.adminlogin(username, role, password);
	}

//login admin 
	public boolean loginAdmin(String username, String role, String password) {

		return ad.loginAdmin(username, role, password);
	}

//get all record from student
	public List<Students> getAllStudents() {

		return ad.getAllStudents();

	}

	// delete record from student
	public boolean deleteStudentByid(int id) {
		return ad.deleteStudentByid(id);

	}

}