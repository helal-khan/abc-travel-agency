package com.abctravelagency.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.RowMapper;
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
		return jdbc.query("SELECT u.FirstName, u.LastName, Status, l.name, access, s.CreatedDate  FROM status s join user u on s.UserId = u.UserId join location l on s.LocationId = l.LocationId where access=0", new RowMapper<Status>() {
			public Status mapRow(ResultSet rs, int rowNum) throws SQLException {
				Status status = new Status();
				status.setStatus(rs.getString("Status"));
				status.setFirstName(rs.getString("FirstName"));
				status.setLastName(rs.getString("LastName"));
				status.setLocation(rs.getString("Name"));
				status.setAccess(rs.getInt("Access"));
				status.setCreatedDate(rs.getTimestamp("CreatedDate"));
				return status;
			}
		});
	}
	
	
	

}
