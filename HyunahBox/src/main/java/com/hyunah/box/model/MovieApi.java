package com.hyunah.box.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MovieApi {
	private String title;			// 영화명
	private String openDate;			// 개봉일
	private String prdtYear;		// 제작연도
	
	/*
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date openDate;
	*/			
	private int movieTime;
	private String movieCdKobis;
	private String movieCdKmdb;
	private String posterUrl;
	private String todayRank;
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getPrdtYear() {
		return prdtYear;
	}
	public void setPrdtYear(String prdtYear) {
		this.prdtYear = prdtYear;
	}
	public int getMovieTime() {
		return movieTime;
	}
	public void setMovieTime(int movieTime) {
		this.movieTime = movieTime;
	}
	public String getMovieCdKobis() {
		return movieCdKobis;
	}
	public void setMovieCdKobis(String movieCdKobis) {
		this.movieCdKobis = movieCdKobis;
	}
	public String getMovieCdKmdb() {
		return movieCdKmdb;
	}
	public void setMovieCdKmdb(String movieCdKmdb) {
		this.movieCdKmdb = movieCdKmdb;
	}
	public String getPosterUrl() {
		return posterUrl;
	}
	public void setPosterUrl(String posterUrl) {
		this.posterUrl = posterUrl;
	}
	public String getTodayRank() {
		return todayRank;
	}
	public void setTodayRank(String todayRank) {
		this.todayRank = todayRank;
	}
	
	


}
