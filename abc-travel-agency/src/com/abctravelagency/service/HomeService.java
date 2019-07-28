package com.abctravelagency.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abctravelagency.dao.HomeDao;
import com.abctravelagency.model.Status;

@Service("homeService")
public class HomeService {
	
	@Autowired
	private HomeDao homeDao;
	
	public List<Status> getAllStatus() {
		return homeDao.getAllStatus();
	}

}
