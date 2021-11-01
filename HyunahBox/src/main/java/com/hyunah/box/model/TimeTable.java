package com.hyunah.box.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TimeTable {
	private int timeTableCode;

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm",  timezone = "Asia/Seoul")
	private Date timeTableDate;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date endTime;
	
	
	private int screenCode;
	
	private String scheduleCode;
	
	private String title;
	
	
	
	

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

	public String getScheduleCode() {
		return scheduleCode;
	}

	public void setScheduleCode(String scheduleCode) {
		this.scheduleCode = scheduleCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	
	

	
}
