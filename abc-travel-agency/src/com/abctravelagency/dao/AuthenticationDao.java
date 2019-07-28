package com.abctravelagency.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.abctravelagency.model.User;

@Component("authenticationDao")
public class AuthenticationDao {
	
	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		try {
			this.jdbc = new NamedParameterJdbcTemplate(jdbc);
		} catch (CannotGetJdbcConnectionException e) {
			System.out.println("Please check jdbc!");
		}
	}

	@Transactional
	public Boolean createAccount(User user) {
		BeanPropertySqlParameterSource userParams = new BeanPropertySqlParameterSource(user);
		
		user.setRole("ROLE_USER");
		user.setEnabled(true);
		
		MapSqlParameterSource userParams1 = new MapSqlParameterSource();
		userParams1.addValue("firstName", user.getFirstName());
		userParams1.addValue("lastName", user.getLastName());
		userParams1.addValue("username", user.getUsername());
		userParams1.addValue("password", passwordEncoder.encode(user.getPassword()));
		userParams1.addValue("email", user.getEmail());
		userParams1.addValue("phone", user.getPhone());
		userParams1.addValue("enabled", user.isEnabled());
		userParams1.addValue("userKey", user.getUserKey());
		userParams1.addValue("role", user.getRole());
		
		try {
			jdbc.update("INSERT INTO user (FirstName, LastName, Username, Password, Email, Phone, Enabled, UserKey, EnabledReset) VALUES (:firstName, :lastName, :username,:password,:email,:phone,:enabled,:userKey, 0)", userParams1);
			return jdbc.update("INSERT INTO userrole (Username, Role) VALUES (:username,:role)", userParams1) == 1;
			
		} catch(DataAccessException e) {
			System.out.println(e.getMessage());
			return false;
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public boolean isExist(String username) {
		return jdbc.queryForObject("select count(*) from user where Username = :username ", 
			   new MapSqlParameterSource("username",username), Integer.class) > 0;
	}
	
	public boolean isExistEmail(String email) {
		return jdbc.queryForObject("select count(*) from user where Email = :email ", 
			   new MapSqlParameterSource("email",email), Integer.class) > 0;
	}

}
