package com.std.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.std.entity.Student;
import com.std.service.QrService;
import com.std.util.QRCodeGenerator;

@Controller
public class QrController {

	@Autowired
	private QrService qs;

	@GetMapping("/generateQR")
	public String generateQR(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userid");

		if (userId == null) {
			model.addAttribute("error", "Session expired or not logged in.");
			return "loginstudent";
		}

		Student student = qs.getStudentByUserId(userId);
		if (student == null) {
			model.addAttribute("error", "Student not found.");
			return "qrView";
		}

		String qrData = "Name: " + student.getFirstname() + " " + student.getMiddelname() + " " + student.getLastname()
				+ "\nDOB: " + student.getDob() + "\nGender: " + student.getGender() + "\nBlood Group: "
				+ student.getBloodgroup() + "\nMother's Name: " + student.getMothername() + "\nAadhaar: "
				+ student.getAadhaarno() + "\nMobile: " + student.getMobileno() + "\nEmail: " + student.getEmail();

		String qrBase64 = QRCodeGenerator.generateQRCodeBase64(qrData);

		model.addAttribute("student", student);
		model.addAttribute("qrBase64", qrBase64);

		return "qrView";
	}
}
