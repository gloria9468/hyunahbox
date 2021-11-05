package com.hyunah.box.service;

public interface HeartService {


	boolean heartMovieCheck(int movieCode, String id);

	void plusHeartMovie(int movieCode, String id);

	void minusHeartMovie(int movieCode, String id);


	
	
}
