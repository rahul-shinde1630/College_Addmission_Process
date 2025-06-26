package com.std.usercontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.std.userservice.UserServices;

@Controller
public class UserController {
	@Autowired
	UserServices sus;

	@RequestMapping("/")
	public String getHomePage() {
		return "home";
	}

	@RequestMapping("/signupStudentPage")
	public String getsignupStudentPage() {
		return "signupstudent";
	}

	@RequestMapping("/signupStudent")
	public String signupStudent(@RequestParam("userid") String userid, @RequestParam("email") String email,
			@RequestParam("password") String password, Model model) {
		boolean isAdd = sus.signUpStudent(userid, email, password);
		if (isAdd) {
			model.addAttribute("successMsg", "Successfully SignUp");
		} else {
			model.addAttribute("errMsg", "❌ Wrong Credentials..! ");
		}

		return "signupstudent";
	}

	@RequestMapping("/loginStudentPage")
	public String getloginStudentPage() {
		return "loginstudent";
	}

	@RequestMapping("/loginStudent")
	public String loginStudent(@RequestParam("userid") String userid, @RequestParam("email") String email,
			@RequestParam("password") String password, Model model, HttpSession session) {
		session.setAttribute("userid", userid);// session.setAttribute("userid", userid);
		boolean isCheck = sus.loginStudent(userid, email, password);

		if (isCheck) {
			String status = sus.getAdmissionStatus(userid); // e.g., "ADMITTED" or "PENDING"
			session.setAttribute("admissionStatus", status);

			model.addAttribute("successMsg", "Successfully Logged In ✅");
			return "redirect:/studentDashboard";
		} else {
			model.addAttribute("errMsg", " Wrong Credentials..! ");
			return "loginstudent"; // ✅ Show login page again with error
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // Ends the session
		return "redirect:/loginStudentPage"; // Fixed: redirect to the mapped login page
	}

}
