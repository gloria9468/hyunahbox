package com.hyunah.box.service;

import java.util.List;
import java.util.Map;

import com.hyunah.box.model.Booking;
import com.hyunah.box.model.ScreenInfo;
import com.hyunah.box.model.SitsInfo;

public interface SitsInfoServie {

	void add(int sitTotal, int screenCode);

	void delete(int screenCode);

	List<SitsInfo> getSitsInfo(Map<String, Object> map);


	void payment(Booking booking);

	int add(ScreenInfo screenInfo);


}
