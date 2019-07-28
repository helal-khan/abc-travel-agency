package com.abctravelagency.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abctravelagency.dao.AuthenticationDao;
import com.abctravelagency.dao.ProfileDao;
import com.abctravelagency.model.User;

@Service("authenticationService")
public class AuthenticationService {
	
	@Autowired
	private AuthenticationDao authenticationDao;
	
	public boolean createAccount(User user) {
		return authenticationDao.createAccount(user);
	}
	public boolean isExist(String username) {
		return authenticationDao.isExist(username);
	}
	public boolean isExistEmail(String email) {
		return authenticationDao.isExistEmail(email);
	}
}
