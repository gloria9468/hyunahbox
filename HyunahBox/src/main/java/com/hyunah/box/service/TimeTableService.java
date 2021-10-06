package com.hyunah.box.service;

import java.util.Date;
import java.util.List;

import com.hyunah.box.model.TimeTable;

public interface TimeTableService {

	List<TimeTable> timeList(int screenCode);


	void add(Date timeTableDate, int screenCode, String scheduleCode);

}
