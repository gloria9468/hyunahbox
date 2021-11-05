package com.hyunah.box.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HeartDaoImpl implements HeartDao{
	
	@Autowired
	SqlSession sql;

	@Override
	public int heartMovieCheck(int movieCode, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("movieCode", movieCode);
		map.put("id", id);
		
		return sql.selectOne("heart.heartMovieCheck", map);
	}

	@Override
	public void plusHeartMovie(int movieCode, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("movieCode", movieCode);
		map.put("id", id);
		
		sql.insert("heart.plusHeartMovie", map);
	}

	@Override
	public void minusHeartMovie(int movieCode, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("movieCode", movieCode);
		map.put("id", id);
		
		sql.insert("heart.minusHeartMovie", map);
		
	}



	
	
}
