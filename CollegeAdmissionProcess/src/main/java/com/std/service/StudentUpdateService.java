package com.std.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.dao.StudentUpdateDao;
import com.std.entity.Address;
import com.std.entity.Student;

@Service
public class StudentUpdateService {

	@Autowired
	StudentUpdateDao ado;

	public Student fetchByUserId(String userId) {
		return ado.findStudentByUserId(userId);
	}

	public boolean updateStudentByUserId(Student student) {
		// TODO Auto-generated method stub
		return ado.updateStudentByUserId(student);
	}

	public Address getAddressByUserId(String userId) {
		return ado.getAddressByUserId(userId);
	}

	public boolean updateAddressByUserId(Address address) {
		return ado.updateAddressByUserId(address);
	}
}
