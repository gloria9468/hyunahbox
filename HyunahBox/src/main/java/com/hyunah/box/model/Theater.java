package com.hyunah.box.model;

import java.util.List;


public class Theater {
	
	private int theaterCode;
	private String theater;
	
	List<ScreenInfo> screenInfo;

	
	
	public int getTheaterCode() {
		return theaterCode;
	}

	public void setTheaterCode(int theaterCode) {
		this.theaterCode = theaterCode;
	}

	public String getTheater() {
		return theater;
	}

	public void setTheater(String theater) {
		this.theater = theater;
	}

	public List<ScreenInfo> getScreenInfo() {
		return screenInfo;
	}

	public void setScreenInfo(List<ScreenInfo> screenInfo) {
		this.screenInfo = screenInfo;
	}
	
	
	
	
}