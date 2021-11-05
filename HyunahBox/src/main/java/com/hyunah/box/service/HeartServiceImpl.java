package com.hyunah.box.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.dao.HeartDao;

@Service
public class HeartServiceImpl implements HeartService{
	
	@Autowired
	HeartDao heartDao;

	@Override
	public boolean heartMovieCheck(int movieCode, String id) {
		if(heartDao.heartMovieCheck(movieCode, id) > 0 ) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void plusHeartMovie(int movieCode, String id) {
		heartDao.plusHeartMovie(movieCode, id);
	}

	@Override
	public void minusHeartMovie(int movieCode, String id) {
		heartDao.minusHeartMovie(movieCode, id);		
	}


	
}
