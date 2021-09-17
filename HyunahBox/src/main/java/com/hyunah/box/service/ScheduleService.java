package com.hyunah.box.service;

import java.util.List;

import com.hyunah.box.model.Schedule;

public interface ScheduleService {

	//List<Schedule> list(int screenCode, int theaterCode, int movieCode);

	boolean getScreenInfo(String theaterCode);

	void add(Schedule item);

	List<Schedule> list();

	void delete(String scheduleCode);

}
