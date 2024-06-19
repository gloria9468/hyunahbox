package com.hyunah.box.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.dao.TheaterDao;
import com.hyunah.box.model.Theater;

@Service
public class TheaterServiceImpl implements TheaterService{

	@Autowired
	TheaterDao tDao;
	
	
	@Override
	public List<Theater> list() {
		return tDao.list();
	}

	@Override
	public int add(Theater theater) {
		return tDao.add(theater);
	}

	@Override
	public Theater getItem(int theaterCode) {
		return tDao.getItem(theaterCode);
	}

	@Override
	public void update(Theater theater) {
		tDao.update(theater);
	}

	@Override
	public void delete(int theaterCode) {
		tDao.delete(theaterCode);
	}

	@Override
	public int theaterTotalCnt(Theater theater) {
		return tDao.theaterTotalCnt(theater);
	}

	@Override
	public List<Theater> list(Theater theater) {
		return tDao.list(theater);
	}


}
