package com.hyunah.box.dao;

import java.util.HashMap;
import java.util.List;

import com.hyunah.box.model.Movie;
import com.hyunah.box.model.MovieApi;

public interface MovieDao {

	List<Movie> list(String memId);

	int add(Movie item);

	Movie getItem(int movieCode);

	void update(Movie item);

	void delete(int movieCode);

	List<Movie> list(String memId, String listType);

	void addMoviApiKobis(List<MovieApi> movieList);

	int addMovieApiData(List<MovieApi> movieApiList);

	int addMovieApiMinusData();

	int clearMovieApi();

	List<Movie> list(HashMap<String, Object> map);

	int movieTotalCnt(HashMap<String, Object> map);

}
