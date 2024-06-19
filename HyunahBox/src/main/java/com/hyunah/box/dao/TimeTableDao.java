package com.hyunah.box.dao;

import java.util.Date;
import java.util.List;

import com.hyunah.box.model.TimeTable;

public interface TimeTableDao {

	List<TimeTable> timeList(int screenCode);

	Object add(Date timeTableDate, int screenCode, String scheduleCode);

	int timeTableTotalCnt(TimeTable timeTable);

	List<TimeTable> timeTableList(TimeTable timeTable);

}
