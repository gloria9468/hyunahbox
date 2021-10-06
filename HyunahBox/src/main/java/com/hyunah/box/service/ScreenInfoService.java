package com.hyunah.box.service;

import java.util.List;
import java.util.Map;

import com.hyunah.box.model.Schedule;
import com.hyunah.box.model.ScreenInfo;

public interface ScreenInfoService {

	List<ScreenInfo> list(int theaterCode);


	void add(ScreenInfo screen);


	void delete(int theaterCode, int screenCode);


	ScreenInfo getItem(int theaterCode, int screenCode);


	void update(ScreenInfo screen);


	List<Schedule> screenList(int theaterCode);


}
