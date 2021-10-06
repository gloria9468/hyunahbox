package com.hyunah.box.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.dao.TimeTableDao;
import com.hyunah.box.model.TimeTable;

@Service
public class TimeTableServiceImpl implements TimeTableService{

	@Autowired
	TimeTableDao tDao;
	
	@Override
	public List<TimeTable> timeList(int screenCode) {
		return tDao.timeList(screenCode);
	}

	@Override
	public void add(Date timeTableDate, int screenCode, String scheduleCode) {
		tDao.add(timeTableDate, screenCode,scheduleCode);
	}

	

}
