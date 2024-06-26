package com.hyunah.box.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.dao.MovieDao;
import com.hyunah.box.model.Movie;
import com.hyunah.box.model.MovieApi;
import com.hyunah.box.scheduler.SchedulerUtil;

@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	MovieDao dao;
	
	SchedulerUtil sUtil = new SchedulerUtil();

	@Override
	public List<Movie> list(String memId) {
		return dao.list(memId);
	}
	
	@Override
	public List<Movie> list(String memId, String listType) {
		return dao.list(memId, listType);
	}


	@Override
	public int add(Movie item) {
		return dao.add(item);
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

	@Override
	public void addMoviApiKobis(List<MovieApi> movieList) {
		dao.addMoviApiKobis(movieList);
	}

	@Override
	public int addMovieApiData(List<MovieApi> movieApiList) {
		return dao.addMovieApiData(movieApiList);
	}

	@Override
	public int addMovieApiMinusData() {
		return dao.addMovieApiMinusData();
	}

	
	
	@Override
	public int getApiData() throws Exception {
		int addMovieApiMinusDataCnt = 0;
		List<MovieApi> movieApiList = sUtil.addKobisData();
		if(0 < movieApiList.size()) {
			List<MovieApi> addKmdbDataList = sUtil.addKmdbData(movieApiList);
			int addMovieApiDataCnt = 0;
			if(0 < addKmdbDataList.size()) {
				addMovieApiDataCnt = addMovieApiData(movieApiList);
			}
			
			if(0 < addMovieApiDataCnt) addMovieApiMinusDataCnt = addMovieApiMinusData();
			
			System.out.println("addMovieApiMinusDataCnt----"+ addMovieApiMinusDataCnt);
		}
		int clearMovieApiCnt= clearMovieApi(); // MOVIE_API 테이블에 가장 최근 데이터 빼고, clear 함.
		return addMovieApiMinusDataCnt;
	}

	@Override
	public int clearMovieApi() {
		return dao.clearMovieApi();
	}


	@Override
	public List<Movie> list(HashMap<String, Object> map) {
		return dao.list(map);
	}

	@Override
	public int movieTotalCnt(HashMap<String, Object> map) {
		return dao.movieTotalCnt(map);
	}


	

}
