package com.hyunah.box.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyunah.box.model.Schedule;
import com.hyunah.box.model.ScreenInfo;

@Repository
public class ScreenInfoDaoImpl implements ScreenInfoDao{
	
	@Autowired
	SqlSession sql;

	@Override
	public List<ScreenInfo> list(int theaterCode) {
		return sql.selectList("screenInfo.list", theaterCode);
	}


	@Override
	public void add(ScreenInfo screen) {
		sql.insert("screenInfo.add", screen);
	}
	

	@Override
	public ScreenInfo getItem(int theaterCode, int screenCode) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("theaterCode", theaterCode);
		map.put("screenCode", screenCode);
		return sql.selectOne("screenInfo.getItem", map);
	}


	@Override
	public void update(ScreenInfo screen) {
		sql.update("screenInfo.update", screen);
	}

	@Override
	public void delete(int theaterCode, int screenCode) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("theaterCode", theaterCode);
		map.put("screenCode", screenCode);
		sql.delete("screenInfo.delete", map);
	}


	@Override
	public int getScreenInfo(String theaterCode) {
		return sql.selectOne("screenInfo.getScreen", theaterCode);
	}


	@Override
	public List<Schedule> screenList(int theaterCode) {
		return sql.selectList("screenInfo.screenList", theaterCode);
	}


}
