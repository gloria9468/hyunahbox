package com.hyunah.box.dao;

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


	

	
}
