package com.abctravelagency.model;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;

public class Status {
	
	private int statusId;
	
	@NotEmpty
	private String status;
	@NotNull
	private int locationId;
	private int userId;
	@NotNull
	private int access;
	private int active;
	
	private String location;
	private String firstName;
	private String lastName;
	private Timestamp createdDate;
	private Timestamp updatedDate;
	
	public Status() {
		
	}

	public Status(int statusId, @NotEmpty String status, @NotNull int locationId, int userId, @NotNull int access,
			int active, String location, String firstName, String lastName, Timestamp createdDate,
			Timestamp updatedDate) {
		this.statusId = statusId;
		this.status = status;
		this.locationId = locationId;
		this.userId = userId;
		this.access = access;
		this.active = active;
		this.location = location;
		this.firstName = firstName;
		this.lastName = lastName;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
	}

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getAccess() {
		return access;
	}

	public void setAccess(int access) {
		this.access = access;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
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

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public Timestamp getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Timestamp updatedDate) {
		this.updatedDate = updatedDate;
	}

	@Override
	public String toString() {
		return "Status [statusId=" + statusId + ", status=" + status + ", locationId=" + locationId + ", userId="
				+ userId + ", access=" + access + ", active=" + active + ", location=" + location + ", firstName="
				+ firstName + ", lastName=" + lastName + ", createdDate=" + createdDate + ", updatedDate=" + updatedDate
				+ "]";
	}
}
