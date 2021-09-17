package com.hyunah.box.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TimeTable {
	private int timeTableCode;

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date timeTableDate;
	
	private int screenCode;

	public int getTimeTableCode() {
		return timeTableCode;
	}

	public void setTimeTableCode(int timeTableCode) {
		this.timeTableCode = timeTableCode;
	}

	public Date getTimeTableDate() {
		return timeTableDate;
	}

	public void setTimeTableDate(Date timeTableDate) {
		this.timeTableDate = timeTableDate;
	}

	public int getScreenCode() {
		return screenCode;
	}

	public void setScreenCode(int screenCode) {
		this.screenCode = screenCode;
	}
	
	
	
}
