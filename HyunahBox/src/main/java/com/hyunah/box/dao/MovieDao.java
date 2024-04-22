package com.hyunah.box.dao;

import java.util.List;

import com.hyunah.box.model.Movie;
import com.hyunah.box.model.MovieApi;

public interface MovieDao {

	List<Movie> list(String memId);

	void add(Movie item);

	Movie getItem(int movieCode);

	void update(Movie item);

	void delete(int movieCode);

	List<Movie> list(String memId, String string);

	void addMoviApiKobis(List<MovieApi> movieList);

	int addMovieApiData(List<MovieApi> movieApiList);

	int addMovieApiMinusData();

}
