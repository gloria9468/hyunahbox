package com.hyunah.box.dao;

import java.util.List;

import com.hyunah.box.model.Booking;
import com.hyunah.box.model.SitsInfo;

public interface SitsDao {

	void add(SitsInfo item);

	void delete(int screenCode);

	List<SitsInfo> getSitsInfo(String scheduleCode, int screenCode);


	void payment(Booking booking);

}
