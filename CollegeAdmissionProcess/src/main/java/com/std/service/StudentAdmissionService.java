package com.std.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.dao.StudentAddmissionDao;
import com.std.entity.Address;
import com.std.entity.EducationalDetails;
import com.std.entity.Student;
import com.std.entity.StudentDocument;

@Service
public class StudentAdmissionService {
	@Autowired
	StudentAddmissionDao sad;

	public boolean studentAdmissionService(Student std, String userid) {
		// TODO Auto-generated method stub
		return sad.studentAdmissionDao(std, userid);
	}

	public boolean studentEducationalService(EducationalDetails ed, String userid) {
		// TODO Auto-generated method stub
		return sad.studentEducationalDao(ed, userid);
	}

	public boolean studentAdressService(Address ed, String userid) {
		// TODO Auto-generated method stub
		return sad.studentAdressService(ed, userid);
	}

	public void saveDocuments(StudentDocument doc) {
		sad.saveDocuments(doc);
	}
}
