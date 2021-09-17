package com.hyunah.box.service;

import java.util.List;

import com.hyunah.box.model.Movie;

public interface MovieService {

	List<Movie> list();

	void add(Movie item);

	Movie getItem(int movieCode);

	void update(Movie item);

	void delete(int movieCode);

}
