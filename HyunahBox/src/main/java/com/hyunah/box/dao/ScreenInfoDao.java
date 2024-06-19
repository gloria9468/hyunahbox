package com.hyunah.box.dao;

import java.util.List;

import com.hyunah.box.model.Schedule;
import com.hyunah.box.model.ScreenInfo;

public interface ScreenInfoDao {

	List<ScreenInfo> list(ScreenInfo screenInfo);

	int add(ScreenInfo screen);
	
	void delete(int theaterCode, int screenCode);

	ScreenInfo getItem(int theaterCode, int screenCode);

	void update(ScreenInfo screen);

	int getScreenInfo(String theaterCode);

	List<Schedule> screenList(int theaterCode);

	int screenInfoTotalCnt(ScreenInfo screenInfo);


	

}
