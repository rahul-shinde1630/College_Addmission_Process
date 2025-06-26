package com.std.admincontroller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.std.admindao.AdminProfileDao;
import com.std.entity.Students;
import com.std.util.QRCodeGenerator;

@Controller
public class StudentProfileController {

	@Autowired
	private AdminProfileDao studentDAO;

	@Autowired
	private ServletContext servletContext; // To get real path

	@RequestMapping(value = "/getStudentProfile", method = RequestMethod.GET)
	public String getStudentProfile(@RequestParam("id") int id, Model model) {
		Students student = studentDAO.getStudentByUserId(id);

		// Prepare QR content
		String qrContent = "ID: " + student.getId() + "\nName: " + student.getFirstname() + " " + student.getLastname()
				+ "\nEmail: " + student.getEmail() + "\nMobile: " + student.getMobileno();

		// File name for QR code
		String qrCodeFileName = student.getUserid() + ".png";

		// Absolute path to save QR code image
		String qrCodeFullPath = servletContext.getRealPath("/resources/qr/" + qrCodeFileName);

		// Generate QR code image (overwrite existing)
		QRCodeGenerator.generateQRCodeImage(qrContent, 200, 200, qrCodeFullPath);

		// Add to model
		model.addAttribute("student", student);
		model.addAttribute("qrCodePath", qrCodeFileName);

		return "admin/studentProfileFragment"; // Your JSP fragment for modal body
	}
}
