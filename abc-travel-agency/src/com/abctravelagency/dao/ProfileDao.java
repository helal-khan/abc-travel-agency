package com.abctravelagency.dao;

import java.util.List;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.abctravelagency.model.Location;
import com.abctravelagency.model.Status;
import com.abctravelagency.model.User;


@Component("profileDao")
public class ProfileDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		try {
			this.jdbc = new NamedParameterJdbcTemplate(jdbc);
		} catch (CannotGetJdbcConnectionException e) {
			System.out.println("Please check jdbc!");
		}
	}
	
	public List<Location> getLocation() {
		return jdbc.query("SELECT * FROM location", BeanPropertyRowMapper.newInstance(Location.class));
	}
	
	public List<Status> getStatusByUserId(int userId) {
		return jdbc.query("SELECT StatusId, Status, l.name, access, s.CreatedDate  FROM status s join location l on s.LocationId = l.LocationId where UserId="+userId, BeanPropertyRowMapper.newInstance(Status.class));
	}
	
	public User getUserByUsername(String username) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);
		return jdbc.queryForObject("Select * from user where Username = :username", params, BeanPropertyRowMapper.newInstance(User.class));
	}
	
	public Boolean createPost(Status status) {
		System.out.println(status);
		MapSqlParameterSource statusParams = new MapSqlParameterSource();
		statusParams.addValue("status", status.getStatus());
		statusParams.addValue("locationId", status.getLocationId());
		statusParams.addValue("userId", status.getUserId());
		statusParams.addValue("access", status.getAccess());
		
		try {
			return jdbc.update("INSERT INTO status (Status, LocationId, UserId, Access, Active) VALUES (:status, :locationId, :userId, :access, 0)", statusParams) == 1;
			
		} catch(DataAccessException e) {
			System.out.println(e.getMessage());
			return false;
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public Boolean changeStatusAccess(int statusId, int access) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("statusId", statusId);
		params.addValue("access", access);
		return jdbc.update("UPDATE status SET Access=:access WHERE StatusId=:statusId", params) == 1;
	}

}
