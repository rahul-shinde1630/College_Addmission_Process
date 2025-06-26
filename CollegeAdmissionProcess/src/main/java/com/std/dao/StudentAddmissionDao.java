package com.std.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.std.entity.Address;
import com.std.entity.EducationalDetails;
import com.std.entity.Student;
import com.std.entity.StudentDocument;

@Repository
public class StudentAddmissionDao {
	@Autowired
	JdbcTemplate template;

	public boolean studentAdmissionDao(Student std, String userid) {
		try {
			Object[] args = { std.getFirstname(), std.getMiddelname(), std.getLastname(), std.getEmail(), std.getDob(),
					std.getGender(), std.getBloodgroup(), std.getMothername(), std.getAadhaarno(), std.getMobileno(),
					userid };

			int rs = template.update(
					"INSERT INTO student (firstname, middelname, lastname, email, dob, gender, bloodgroup, mothername, aadhaarno, mobileno,userid) VALUES (?,?,?,?,?,?,?,?,?,?,?)",
					args);

			if (rs == 1) {

				return true;

			} else {

				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return false;
	}

	public boolean studentEducationalDao(EducationalDetails ed, String userid) {
		try {
			String sql = "INSERT INTO educational_details (tenthMarks, tenthBoard, tenthYear, "
					+ "twelfthMarks, twelfthBoard, twelfthYear, course, studyMode, admissionYear,userid) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			Object[] args = { ed.getTenthMarks(), ed.getTenthBoard(), ed.getTenthYear(), ed.getTwelfthMarks(),
					ed.getTwelfthBoard(), ed.getTwelfthYear(), ed.getCourse(), ed.getStudyMode(), ed.getAdmissionYear(),
					userid };

			int result = template.update(sql, args);

			return result == 1;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean studentAdressService(Address ed, String userid) {
		String sql = "INSERT INTO address_details (current_address, current_village, tahsil, currentdistrict, state, country, pincode,userid) VALUES (?, ?, ?, ?, ?, ?,?,?)";

		int result = template.update(sql, ed.getCurrentAddress(), ed.getCurrentVillage(), ed.getTahsil(),
				ed.getCurrentDistrict(), ed.getState(), ed.getCountry(), ed.getPincode(), userid);
		if (result == 1) {

			return true;

		} else {

			return false;
		}
	}

	public void saveDocuments(StudentDocument doc) {
		String sql = "INSERT INTO student_documents (userid, aadhar_path, marksheet_path, tc_path, photo_path) VALUES (?, ?, ?, ?, ?)";
		template.update(sql, doc.getUserid(), doc.getAadharPath(), doc.getMarksheetPath(), doc.getTcPath(),
				doc.getPhotoPath());
	}

}
