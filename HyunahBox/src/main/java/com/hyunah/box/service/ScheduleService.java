package com.hyunah.box.service;

import java.util.List;

import com.hyunah.box.model.Schedule;

public interface ScheduleService {

	//List<Schedule> list(int screenCode, int theaterCode, int movieCode);

	boolean getScreenInfo(String theaterCode);

	void add(Schedule item);

	List<Schedule> list();

	void delete(String scheduleCode);



	List<Schedule> getTimeTable(String clickDay, int pickTheater1, List<Integer> theaters, List<Integer> movies);


}
