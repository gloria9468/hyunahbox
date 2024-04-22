package com.hyunah.box.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.dao.MovieDao;
import com.hyunah.box.model.Movie;

@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	MovieDao dao;

	@Override
	public List<Movie> list(String memId) {
		return dao.list(memId);
	}
	
	@Override
	public List<Movie> list(String memId, String string) {
		return dao.list(memId, "main");
	}


	@Override
	public void add(Movie item) {
		dao.add(item);
	}

	@Override
	public Movie getItem(int movieCode) {
		return dao.getItem(movieCode);
	}

	@Override
	public void update(Movie item) {
		dao.update(item);
	}

	@Override
	public void delete(int movieCode) {
		dao.delete(movieCode);
	}


	

}
