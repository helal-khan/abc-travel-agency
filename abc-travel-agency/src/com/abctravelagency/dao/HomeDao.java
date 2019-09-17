package com.abctravelagency.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.abctravelagency.model.Status;

@Component("homeDao")
public class HomeDao {
	
	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	public void setDataSource(DataSource jdbc) {
		try {
			this.jdbc = new NamedParameterJdbcTemplate(jdbc);
		} catch (CannotGetJdbcConnectionException e) {
			System.out.println("Please check jdbc!");
		}
	}
	
	public List<Status> getAllStatus() {
		return jdbc.query("SELECT u.FirstName, u.LastName, Status, l.name, access, s.CreatedDate  FROM status s join user u on s.UserId = u.UserId join location l on s.LocationId = l.LocationId where access=0", BeanPropertyRowMapper.newInstance(Status.class));
	}
}
