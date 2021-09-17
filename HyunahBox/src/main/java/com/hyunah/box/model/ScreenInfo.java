package com.hyunah.box.model;

import java.util.List;

public class ScreenInfo {
	
	private int screenCode;
	private int theaterCode;
	private int sitTotal;
	private String sitRow;
	private int sitCol;
	private int screenNum;
	
	List<TimeTable> timeTableList;
	
	
	
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
	public String getSitRow() {
		return sitRow;
	}
	public void setSitRow(String sitRow) {
		this.sitRow = sitRow;
	}
	public int getSitCol() {
		return sitCol;
	}
	public void setSitCol(int sitCol) {
		this.sitCol = sitCol;
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
	

	
	

	
}