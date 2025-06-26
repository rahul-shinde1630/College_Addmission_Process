package com.std.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.dao.QrDao;
import com.std.entity.Student;

@Service
public class QrService {

	@Autowired
	private QrDao qd;

	public Student getStudentByUserId(String userId) {
		return qd.getStudentByUserId(userId);
	}
}
