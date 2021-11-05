package com.hyunah.box.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyunah.box.model.Booking;
import com.hyunah.box.model.SitsInfo;

@Repository
public class SitsDaoImpl implements SitsDao{
	
	@Autowired
	SqlSession sql;

	@Override
	public void add(SitsInfo item) {
		sql.insert("sitsInfo.add", item);
	}

	@Override
	public void delete(int screenCode) {
		sql.delete("sitsInfo.delete", screenCode);
	}

	@Override
	public List<SitsInfo> getSitsInfo(String scheduleCode, int screenCode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("scheduleCode", scheduleCode);
		map.put("screenCode", screenCode);
		
		return sql.selectList("sitsInfo.getSitsInfo", map);
	}


	@Override
	public void payment(Booking booking) {
		sql.insert("sitsInfo.payment", booking);
		
	}
	
	
}
