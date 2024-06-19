package com.hyunah.box.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyunah.box.model.TimeTable;

@Repository
public class TimeTableDaoImpl implements TimeTableDao{
	
	@Autowired
	SqlSession sql;

	@Override
	public List<TimeTable> timeList(int screenCode) {
		return sql.selectList("timeTable.timeList", screenCode);
		
	}

	@Override
	public Object add(Date timeTableDate, int screenCode, String scheduleCode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("timeTableDate", timeTableDate);
		map.put("screenCode", screenCode);
		map.put("scheduleCode", scheduleCode);
		return sql.insert("timeTable.tAdd",map);
	}

	@Override
	public int timeTableTotalCnt(TimeTable timeTable) {
		return sql.selectOne("timeTable.timeTableTotalCnt", timeTable);
	}

	@Override
	public List<TimeTable> timeTableList(TimeTable timeTable) {
		return sql.selectList("timeTable.timeTableList", timeTable);
	}

}
