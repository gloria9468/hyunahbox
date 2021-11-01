package com.hyunah.box.model;

import java.util.List;


public class SearchTimeTable {
	String clickDay;
	int pickTheater1;
	List<Integer> theaters;
	List<Integer> movies;
	
	
	public String getClickDay() {
		return clickDay;
	}
	public void setClickDay(String clickDay) {
		this.clickDay = clickDay;
	}
	public int getPickTheater1() {
		return pickTheater1;
	}
	public void setPickTheater1(int pickTheater1) {
		this.pickTheater1 = pickTheater1;
	}
	public List<Integer> getTheaters() {
		return theaters;
	}
	public void setTheaters(List<Integer> theaters) {
		this.theaters = theaters;
	}
	public List<Integer> getMovies() {
		return movies;
	}
	public void setMovies(List<Integer> movies) {
		this.movies = movies;
	}
	
	
}