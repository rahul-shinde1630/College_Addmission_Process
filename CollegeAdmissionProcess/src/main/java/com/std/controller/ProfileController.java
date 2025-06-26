package com.std.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.std.dao.ProfileDao;
import com.std.entity.Student;
import com.std.entity.StudentDocument;

@Controller
public class ProfileController {

	@Autowired
	private ProfileDao profileDao;

	@RequestMapping(value = "/viewProfile", method = RequestMethod.GET)
	public String viewProfile(HttpSession session, Model model) {
		try {
			String userId = (String) session.getAttribute("userid");
			if (userId != null) {
				// Fetch student details
				Student student = profileDao.getStudentByUserId(userId);

				// Fetch student document details (including photoPath)
				StudentDocument document = profileDao.getDocumentByUserId(userId);

				// Add data to the model
				model.addAttribute("student", student);
				model.addAttribute("studentDoc", document);

				model.addAttribute("profileGenerated", true); // Add the entire StudentDocument object to the model

				return "profileView"; // Return JSP page to display the profile
			} else {
				model.addAttribute("errMsg", "Session expired. Please log in again.");
				return "login"; // Redirect to login page
			}
		} catch (Exception e) {
			model.addAttribute("errMsg", "Error loading profile.");
			e.printStackTrace();
			return "studentDashboard"; // Handle error page
		}
	}
}
