package com.hyunah.box.model;

import java.util.List;

public class Booking {
	
	private int bookingCode;
	private String id;
	private String scheduleCode;
	private int screenCode;
	private int sitsCode;
	
	List<Integer> selectedSits;
	
	
	
	
	public int getBookingCode() {
		return bookingCode;
	}
	public void setBookingCode(int bookingCode) {
		this.bookingCode = bookingCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getScheduleCode() {
		return scheduleCode;
	}
	public void setScheduleCode(String scheduleCode) {
		this.scheduleCode = scheduleCode;
	}
	public int getScreenCode() {
		return screenCode;
	}
	public void setScreenCode(int screenCode) {
		this.screenCode = screenCode;
	}
	public int getSitsCode() {
		return sitsCode;
	}
	public void setSitsCode(int sitsCode) {
		this.sitsCode = sitsCode;
	}
	public List<Integer> getSelectedSits() {
		return selectedSits;
	}
	public void setSelectedSits(List<Integer> selectedSits) {
		this.selectedSits = selectedSits;
	}
	
	
	
}
