package com.abctravelagency.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abctravelagency.dao.ProfileDao;
import com.abctravelagency.model.Location;
import com.abctravelagency.model.Status;
import com.abctravelagency.model.User;

@Service("profileService")
public class ProfileService {
	
	@Autowired
	private ProfileDao profileDao;
	
	public List<Location> getLocation() {
		return profileDao.getLocation();
	}
	public User getUserByUsername(String username) {
		return profileDao.getUserByUsername(username);
	}
	public Boolean createPost(Status status) {
		return profileDao.createPost(status);
	}
	public List<Status> getStatusByUserId(int userId) {
		return profileDao.getStatusByUserId(userId);
	}
	public Boolean changeStatusAccess(int statusId, int access) {
		return profileDao.changeStatusAccess(statusId, access);
	}
}
