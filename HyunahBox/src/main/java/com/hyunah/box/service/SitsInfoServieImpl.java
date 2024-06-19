package com.hyunah.box.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.dao.SitsDao;
import com.hyunah.box.model.Booking;
import com.hyunah.box.model.MovieApi;
import com.hyunah.box.model.ScreenInfo;
import com.hyunah.box.model.SitsInfo;

@Service
public class SitsInfoServieImpl implements SitsInfoServie{

	@Autowired
	SitsDao sitsDao;


	@Override
	public void add(int sitTotal, int screenCode) {
		for(int i = 1; i <= sitTotal; i++) {
			SitsInfo item = new SitsInfo();
			item.setScreenCode(screenCode);
			item.setSitsCode(i);
			
			sitsDao.add(item);
		}
		
	}
	
	@Override
	public int add(ScreenInfo screenInfo) {
		int sitsTotal = screenInfo.getSitTotal();
		int screenCode = screenInfo.getScreenCode();
		List<SitsInfo> sitsInfoList = new ArrayList<SitsInfo>();
		for(int i = 1; i <= sitsTotal; i++) {
			SitsInfo item = new SitsInfo();
			item.setScreenCode(screenCode);
			item.setSitsCode(i);
			sitsInfoList.add(item);
		}
		
		return sitsDao.add(sitsInfoList);
	}



	@Override
	public void delete(int screenCode) {
		sitsDao.delete(screenCode);
	}
	

	@Override
	public List<SitsInfo> getSitsInfo(Map<String, Object> map) {
		String scheduleCode = (String)map.get("SCHEDULE_CODE");
		int screenCode =  Integer.parseInt( String.valueOf( map.get("SCREEN_CODE") ) );
		
		return sitsDao.getSitsInfo(scheduleCode, screenCode);
	}



	@Override
	public void payment(Booking booking) {
		for( int sitsCode : booking.getSelectedSits() ) {
			booking.setSitsCode(sitsCode);
			sitsDao.payment(booking);
		}
	}


	
	
}
