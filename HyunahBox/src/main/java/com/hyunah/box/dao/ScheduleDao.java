package com.hyunah.box.dao;

import java.util.List;

import com.hyunah.box.model.Schedule;

public interface ScheduleDao {


	void add(Schedule item);

	List<Schedule> list();

	void delete(String scheduleCode);



}
