package com.hyunah.box.model;

import java.util.List;

public class ScreenInfo {
	
	private int screenCode;
	private int theaterCode;
	private int sitTotal;
	private int screenNum;
	
	List<TimeTable> timeTableList;
	
	private String theater;
	

	public int getScreenCode() {
		return screenCode;
	}

	public void setScreenCode(int screenCode) {
		this.screenCode = screenCode;
	}

	public int getTheaterCode() {
		return theaterCode;
	}

	public void setTheaterCode(int theaterCode) {
		this.theaterCode = theaterCode;
	}

	public int getSitTotal() {
		return sitTotal;
	}

	public void setSitTotal(int sitTotal) {
		this.sitTotal = sitTotal;
	}

	public int getScreenNum() {
		return screenNum;
	}

	public void setScreenNum(int screenNum) {
		this.screenNum = screenNum;
	}

	public List<TimeTable> getTimeTableList() {
		return timeTableList;
	}

	public void setTimeTableList(List<TimeTable> timeTableList) {
		this.timeTableList = timeTableList;
	}

	public String getTheater() {
		return theater;
	}

	public void setTheater(String theater) {
		this.theater = theater;
	}

	
	
}