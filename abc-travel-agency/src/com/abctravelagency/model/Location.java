package com.abctravelagency.model;

import java.sql.Timestamp;

public class Location {

	private int locationId;
	private String name;
	private int active;
	private Timestamp createdDate;
	private Timestamp updatedDate;
	
	public Location() {
		
	}

	public Location(int locationId, String name, int active, Timestamp createdDate, Timestamp updatedDate) {
		this.locationId = locationId;
		this.name = name;
		this.active = active;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
	}
	
	public Location(String name, int active, Timestamp createdDate, Timestamp updatedDate) {
		this.name = name;
		this.active = active;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
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
		return "Location [locationId=" + locationId + ", name=" + name + ", active=" + active + ", createdDate="
				+ createdDate + ", updatedDate=" + updatedDate + "]";
	}
}
