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
	public void add(Theater theater) {
		tDao.add(theater);
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


}
