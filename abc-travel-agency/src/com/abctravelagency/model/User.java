package com.abctravelagency.model;

import java.sql.Timestamp;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

public class User {
	
	private int userId;
	
	@NotEmpty
	private String firstName;
	
	@NotEmpty
	private String lastName;
	
	@NotEmpty
	@Size(min=6, max=30)
	@Pattern(regexp="^[a-zA-Z0-9_.]+$")
	private String username;
	
	@NotEmpty
	@Size(min=6, max=30)
	@Pattern(regexp="^\\S+$")
	private String password;
	
	@NotEmpty
	@Email
	private String email;
	
	@NotEmpty()
	@Pattern(regexp="^(01)(1|7|8|9|6|3|4)[0-9]{8}$")
	private String phone;
	
	private boolean enabled=true;
	private String userKey;
	private String role;
	private Timestamp CreatedDate;
	private Timestamp UpdatedDate;
	
	public User() {
		
	}
	
	public User(String firstName, String lastName,
			@NotEmpty @Size(min = 6, max = 30) @Pattern(regexp = "^[a-zA-Z0-9_.]+$") String username,
			@NotEmpty @Size(min = 6, max = 30) @Pattern(regexp = "^\\S+$") String password,
			@NotEmpty @Email String email, @NotEmpty @Pattern(regexp = "^(01)(1|7|8|9|6)[0-9]{8}$") String phone,
			boolean enabled, String userKey, String role, Timestamp createdDate, Timestamp updatedDate) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.enabled = enabled;
		this.userKey = userKey;
		this.role = role;
		CreatedDate = createdDate;
		UpdatedDate = updatedDate;
	}

	public User(int userId, String firstName, String lastName,
			@NotEmpty @Size(min = 6, max = 30) @Pattern(regexp = "^[a-zA-Z0-9_.]+$") String username,
			@NotEmpty @Size(min = 6, max = 30) @Pattern(regexp = "^\\S+$") String password,
			@NotEmpty @Email String email, @NotEmpty @Pattern(regexp = "^(01)(1|7|8|9|6)[0-9]{8}$") String phone,
			boolean enabled, String userKey, String role, Timestamp createdDate, Timestamp updatedDate) {
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.enabled = enabled;
		this.userKey = userKey;
		this.role = role;
		CreatedDate = createdDate;
		UpdatedDate = updatedDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getUserKey() {
		return userKey;
	}

	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Timestamp getCreatedDate() {
		return CreatedDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		CreatedDate = createdDate;
	}

	public Timestamp getUpdatedDate() {
		return UpdatedDate;
	}

	public void setUpdatedDate(Timestamp updatedDate) {
		UpdatedDate = updatedDate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", username="
				+ username + ", password=" + password + ", email=" + email + ", phone=" + phone + ", enabled=" + enabled
				+ ", userKey=" + userKey + ", role=" + role + ", CreatedDate=" + CreatedDate + ", UpdatedDate="
				+ UpdatedDate + "]";
	}
	
}
