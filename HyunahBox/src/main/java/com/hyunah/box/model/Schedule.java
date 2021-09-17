package com.hyunah.box.model;

import java.util.List;


public class Schedule {

	private String scheduleCode;
	
	private int movieCode;
	private int theaterCode;
	private int screenCode;
	private int screenNum;
	
	List<Movie> movieList;	
	List<Theater> theaterList;
	
	
	
	
	
	public String getScheduleCode() {
		return scheduleCode;
	}
	public void setScheduleCode(String scheduleCode) {
		this.scheduleCode = scheduleCode;
	}
	public int getMovieCode() {
		return movieCode;
	}
	public void setMovieCode(int movieCode) {
		this.movieCode = movieCode;
	}
	public int getTheaterCode() {
		return theaterCode;
	}
	public void setTheaterCode(int theaterCode) {
		this.theaterCode = theaterCode;
	}
	public int getScreenCode() {
		return screenCode;
	}
	public void setScreenCode(int screenCode) {
		this.screenCode = screenCode;
	}
	public int getScreenNum() {
		return screenNum;
	}
	public void setScreenNum(int screenNum) {
		this.screenNum = screenNum;
	}
	public List<Movie> getMovieList() {
		return movieList;
	}
	public void setMovieList(List<Movie> movieList) {
		this.movieList = movieList;
	}
	public List<Theater> getTheaterList() {
		return theaterList;
	}
	public void setTheaterList(List<Theater> theaterList) {
		this.theaterList = theaterList;
	}

	
}