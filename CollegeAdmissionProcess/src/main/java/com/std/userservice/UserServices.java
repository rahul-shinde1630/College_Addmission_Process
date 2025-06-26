package com.std.userservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.userdao.UserDao;

@Service
public class UserServices {
	@Autowired
	UserDao aud;

	public boolean signUpStudent(String userid, String email, String password) {

		return aud.signUpStudent(userid, email, password);
	}

	public boolean loginStudent(String userid, String email, String password) {
		return aud.loginStudent(userid, email, password);
	}

	public String getAdmissionStatus(String userid) {
		// TODO Auto-generated method stub
		return aud.getAdmissionStatus(userid);
	}

}
