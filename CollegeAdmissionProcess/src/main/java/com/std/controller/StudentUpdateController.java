package com.std.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.std.entity.Address;
import com.std.entity.Student;
import com.std.service.StudentUpdateService;

@Controller
public class StudentUpdateController {

	@Autowired
	StudentUpdateService sus;

	// ✅ Get student details using session userId
	@CrossOrigin
	@ResponseBody
	@GetMapping("/getStudentDetails")
	public Student fetchStudent(HttpSession session) {
		String userId = (String) session.getAttribute("userid");
		System.out.println("Fetching student for userId: " + userId);

		if (userId == null) {
			System.out.println("⚠️ User ID is null in session — probably not logged in properly.");
			return null;
		}

		Student student = sus.fetchByUserId(userId);
		if (student == null) {
			System.out.println("❌ No student found in DB for userId: " + userId);
		} else {
			System.out.println("✅ Student fetched: " + student.getFirstname());
		}
		return student;
	}

	@PostMapping("/updateStudentByUserId")
	@ResponseBody
	public String updateStudent(@RequestBody Student student) {
		System.out.println("Received: " + student); // 🔍 Debug
		boolean updated = sus.updateStudentByUserId(student);
		return updated ? "success" : "error";
	}

	// Address Update
	@CrossOrigin
	@ResponseBody
	@GetMapping("/getAddressDetails")
	public Address getAddressByUserId(HttpSession session) {
		String userId = (String) session.getAttribute("userid");
		return sus.getAddressByUserId(userId);
	}

	@PostMapping("/updateAddressByUserId")
	@ResponseBody
	public String updateAddress(@RequestBody Address address) {
		boolean updated = sus.updateAddressByUserId(address);
		return updated ? "success" : "fail";
	}

}
