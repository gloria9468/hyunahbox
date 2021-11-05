package com.hyunah.box.dao;

public interface HeartDao {

	int heartMovieCheck(int movieCode, String id);

	void plusHeartMovie(int movieCode, String id);

	void minusHeartMovie(int movieCode, String id);



}
