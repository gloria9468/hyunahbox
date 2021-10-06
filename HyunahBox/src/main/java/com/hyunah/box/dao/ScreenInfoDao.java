package com.hyunah.box.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.hyunah.box.model.Schedule;
import com.hyunah.box.model.ScreenInfo;

public interface ScreenInfoDao {

	List<ScreenInfo> list(int theaterCode);

	void add(ScreenInfo screen);

	void delete(int theaterCode, int screenCode);

	ScreenInfo getItem(int theaterCode, int screenCode);

	void update(ScreenInfo screen);

	int getScreenInfo(String theaterCode);

	List<Schedule> screenList(int theaterCode);

}
