package com.hyunah.box.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.dao.ScheduleDao;
import com.hyunah.box.dao.ScreenInfoDao;
import com.hyunah.box.model.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	ScreenInfoDao screenInfoDao;
	
	@Autowired
	ScheduleDao sDao;

	@Override
	public boolean getScreenInfo(String theaterCode) {
		if(screenInfoDao.getScreenInfo(theaterCode) > 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void add(Schedule item) {
		sDao.add(item);
	}

	@Override
	public List<Schedule> list() {
		return sDao.list();
	}

	@Override
	public void delete(String scheduleCode) {
		sDao.delete(scheduleCode);
	}


	@Override
	public List<Schedule> getTimeTable(String clickDay, int pickTheater1, List<Integer> theaters, List<Integer> movies) {
		return sDao.getTimeTable(clickDay, pickTheater1, theaters, movies);
	}


}
