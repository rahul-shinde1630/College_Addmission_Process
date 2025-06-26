package com.std.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.std.entity.Address;
import com.std.entity.EducationalDetails;
import com.std.entity.Student;
import com.std.entity.StudentDocument;
import com.std.service.StudentAdmissionService;

@Controller
public class StudentAdmissionController {
	@Autowired
	StudentAdmissionService sas;

	@RequestMapping("/StudentPersonalDetails")
	public String studentPersonalDetailsAdd(@ModelAttribute Student std, Model model, HttpSession sessions) {

		String userid = (String) sessions.getAttribute("userid");
		boolean isAdded = sas.studentAdmissionService(std, userid);
		if (isAdded) {
			model.addAttribute("successMsg", "Successfully Addedd");
		} else {
			model.addAttribute("errMsg", "Student Not Addedd");
		}

		return "redirect:/educationalDetailForm";
	}

	@RequestMapping("/EducationalDetails")
	public String studentEducationalDetailsAdd(@ModelAttribute EducationalDetails ed, Model model,
			HttpSession sessions) {

		String userid = (String) sessions.getAttribute("userid");

		if (userid == null || userid.isEmpty()) {
			model.addAttribute("errMsg", "Session expired! Please restart the admission process.");
			return "redirect:/personalDetailsForm";
		}

		boolean isAdded = sas.studentEducationalService(ed, userid);
		if (isAdded) {
			model.addAttribute("successMsg", "Successfully Addedd");
		} else {
			model.addAttribute("errMsg", "Student Not Addedd");
		}

		return "redirect:/addressDetailForm";
	}

	@RequestMapping("/SubmitAddress")
	public String studentAddressDetailsAdd(@ModelAttribute Address ed, Model model, HttpSession sessions) {

		String userid = (String) sessions.getAttribute("userid");

		if (userid == null || userid.isEmpty()) {
			model.addAttribute("errMsg", "Session expired! Please restart the admission process.");
			return "redirect:/addressDetailForm";
		}

		boolean isAdded = sas.studentAdressService(ed, userid);
		if (isAdded) {
			model.addAttribute("successMsg", "Successfully Addedd");
		} else {
			model.addAttribute("errMsg", "Student Not Addedd");
		}

		return "redirect:/documentUploadForms";
	}

	@PostMapping("/submitDocuments")
	public String handleDocumentUpload(@RequestParam("aadhar") MultipartFile aadhar,
			@RequestParam("marksheet") MultipartFile marksheet, @RequestParam("tc") MultipartFile tc,
			@RequestParam("photo") MultipartFile photo, HttpSession session, RedirectAttributes redirect) {
		try {
			String userId = (String) session.getAttribute("userid");

			String basePath = "/resources/uploads/photos/"; // Make all files public
			String realPath = session.getServletContext().getRealPath(basePath);
			new File(realPath).mkdirs();

			String photoFileName = "photo_" + photo.getOriginalFilename();
			String aadharFileName = "aadhar_" + aadhar.getOriginalFilename();
			String marksheetFileName = "marksheet_" + marksheet.getOriginalFilename();
			String tcFileName = "tc_" + tc.getOriginalFilename();

			photo.transferTo(new File(realPath + File.separator + photoFileName));
			aadhar.transferTo(new File(realPath + File.separator + aadharFileName));
			marksheet.transferTo(new File(realPath + File.separator + marksheetFileName));
			tc.transferTo(new File(realPath + File.separator + tcFileName));

			StudentDocument doc = new StudentDocument();
			doc.setUserid(userId);
			doc.setPhotoPath(basePath + photoFileName); // ✅ Web-accessible path
			doc.setAadharPath(basePath + aadharFileName); // ✅
			doc.setMarksheetPath(basePath + marksheetFileName);// ✅
			doc.setTcPath(basePath + tcFileName); // ✅

			sas.saveDocuments(doc); // save to DB

			redirect.addFlashAttribute("successMsg", "Documents uploaded successfully!");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("errMsg", "Error uploading documents.");
		}

		return "documentUploadForm"; // 🔁 use redirect to refresh safely
	}

}
