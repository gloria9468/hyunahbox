package com.hyunah.box.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.dao.ScreenInfoDao;
import com.hyunah.box.model.Schedule;
import com.hyunah.box.model.ScreenInfo;


@Service
public class ScreenInfoServiceImpl implements ScreenInfoService{

	@Autowired
	ScreenInfoDao dao;
	
	@Override
	public List<ScreenInfo> list(int theaterCode) {
		return dao.list(theaterCode);
	}


	@Override
	public void add(ScreenInfo screen) {
		dao.add(screen);
	}


	@Override
	public ScreenInfo getItem(int theaterCode, int screenCode) {
		return dao.getItem(theaterCode, screenCode);
	}


	@Override
	public void update(ScreenInfo screen) {
		dao.update(screen);
	}

	@Override
	public void delete(int theaterCode, int screenCode) {
		dao.delete(theaterCode, screenCode);
	}


	@Override
	public List<Schedule> screenList(int theaterCode) {
		return dao.screenList(theaterCode);
	}


	

	
}
