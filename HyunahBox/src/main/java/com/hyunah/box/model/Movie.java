package com.hyunah.box.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Movie {
	private int movieCode;
	private String title;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date openDate;
	private int heart;
	private int movieTime;
	
	private String id;
	
	public int getMovieCode() {
		return movieCode;
	}
	public void setMovieCode(int movieCode) {
		this.movieCode = movieCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public Date getOpenDate() {
		return openDate;
	}
	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	
	public int getHeart() {
		return heart;
	}
	public void setHeart(int heart) {
		this.heart = heart;
	}
	public int getMovieTime() {
		return movieTime;
	}
	public void setMovieTime(int movieTime) {
		this.movieTime = movieTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
