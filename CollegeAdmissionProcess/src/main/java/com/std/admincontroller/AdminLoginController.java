package com.std.admincontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.std.adminservice.AdminLoginService;
import com.std.entity.Students;

@Controller
public class AdminLoginController {

	@Autowired
	AdminLoginService als;

	@RequestMapping("/adminlogin")
	public String getadminloginpage() {

		return "adminlogin";
	}

	@RequestMapping("/adminLoginpage")
	public String getadminloginpagelogout() {

		return "redirect:/adminlogin";
	}

	// add new admin
	@PostMapping("/adminlogin")
	public String adminlogin(@RequestParam("username") String username, @RequestParam("role") String role,
			@RequestParam("password") String password, Model model) {
		boolean isAdd = als.adminlogin(username, role, password);
		if (isAdd) {
			model.addAttribute("successMsg", "Successfully Admin login");
		} else {
			model.addAttribute("errMsg", " Wrong Credentials..! ");
		}

		return "adminlogin";
	}

	// check admin credentials are correct or not
	@RequestMapping("/loginadmin")
	public String loginAdmin(@RequestParam("username") String username, @RequestParam("role") String role,
			@RequestParam("password") String password, Model model, HttpSession session) {
		session.setAttribute("username", username);// session.setAttribute("userid", userid);
		boolean isCheck = als.loginAdmin(username, role, password);

		if (isCheck) {

			model.addAttribute("successMsg", "Successfully Logged In ✅");
			return "adminDashboard";
		} else {
			model.addAttribute("errMsg", "❌ Wrong Credentials..! ");
			return "adminlogin"; // ✅ Show login page again with error
		}
	}

	// get admin dashboard
	@RequestMapping("/admindashbord")
	public String adminDashboard() {
		return "adminDashboard";

	}

	// get all records
	@RequestMapping("/studentList")
	public String getAllStudents(Model model) {
		List<Students> std = als.getAllStudents();
		model.addAttribute("students", std);
		return "studentList";

	}

	// delete from table
	@RequestMapping("/deletes")
	public String deleteStudentByid(@RequestParam("id") int id) {
		als.deleteStudentByid(id);

		return "studentList";
	}

}