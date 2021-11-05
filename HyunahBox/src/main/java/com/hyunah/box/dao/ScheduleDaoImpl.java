package com.hyunah.box.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyunah.box.model.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{

	@Autowired
	SqlSession sql;


	@Override
	public void add(Schedule item) {
		sql.insert("schedule.add", item);
	}



	@Override
	public List<Schedule> list() {
		return sql.selectList("schedule.list");
	}



	@Override
	public void delete(String scheduleCode) {
		sql.delete("schedule.delete", scheduleCode);
	}





	@Override
	public List<Schedule> getTimeTable(String clickDay, int pickTheater1, List<Integer> theaters, List<Integer> movies) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("clickDay", clickDay);
		map.put("pickTheater1", pickTheater1);
		map.put("pickTheater2", theaters.get(0));
		map.put("pickTheater3", theaters.get(1));
		map.put("pickMovie1", movies.get(0));
		map.put("pickMovie2", movies.get(1));
		map.put("pickMovie3", movies.get(2));
		
		return sql.selectList("schedule.getTimeTable", map);
		
	}

	
}
