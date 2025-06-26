package com.std.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudentDashboardController {

	@RequestMapping("/studentDashboard")
	public String getDashboardHomePage() {
		return "studentDashboard";
	}

	@RequestMapping("/studentDashboards")
	public String loadDashboard() {
		return "studentDashboard"; // JSP file name without .jsp
	}

	@RequestMapping("/personalDetailForm")
	public String personalDetailFormPage() {
		return "personalDetailForm";
	}

	@RequestMapping("/educationalDetailForm")
	public String studentEducationalFormPage() {
		return "educationalDetailForm";
	}

	@RequestMapping("/addressDetailForm")
	public String getupdateStudentPage() {
		return "addressDetailForm";
	}

	@RequestMapping("/documentUploadForms")
	public String getdocumentUploadForm() {
		return "documentUploadForm";
	}

	@RequestMapping("/updateStudentPage")
	public String showUpdatePage() {
		return "studentUpdate"; // Loads update.jsp from /WEB-INF/views
	}

	@RequestMapping("/studentUpdateAddress")
	public String studentUpdateAddress() {
		return "studentUpdateAddress"; // Loads update.jsp from /WEB-INF/views
	}

	@RequestMapping("/profileView")
	public String profileView() {
		return "profileView";
	}

	@RequestMapping("/generateQRPage")
	public String qrGenerator() {
		return "qrView";
	}
}
