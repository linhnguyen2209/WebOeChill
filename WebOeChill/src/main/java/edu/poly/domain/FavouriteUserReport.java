package edu.poly.domain;

import java.util.Date;

public class FavouriteUserReport {
	private String username;
	private String fullName;
	private String email;
	private Date likedDate;

	public FavouriteUserReport() {
	}

	public FavouriteUserReport(String username, String fullName, String email, Date likedDate) {
		this.username = username;
		this.fullName = fullName;
		this.email = email;
		this.likedDate = likedDate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getLikedDate() {
		return likedDate;
	}

	public void setLikedDate(Date likedDate) {
		this.likedDate = likedDate;
	}

}
