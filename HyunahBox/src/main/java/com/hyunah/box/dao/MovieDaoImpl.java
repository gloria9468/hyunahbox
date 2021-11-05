package com.hyunah.box.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyunah.box.model.Movie;

@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Movie> list(String memId) {
		return sql.selectList("movie.list", memId);
	}
	@Override
	public List<Movie> list(String memId, String string) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("main", "main");
		
		return sql.selectList("movie.list", map);
	}

	@Override
	public void add(Movie item) {
		sql.insert("movie.add",item);
	}

	@Override
	public Movie getItem(int movieCode) {
		return sql.selectOne("movie.getItem", movieCode);
	}

	@Override
	public void update(Movie item) {
		sql.update("movie.update", item);
	}

	@Override
	public void delete(int movieCode) {
		sql.delete("movie.delete", movieCode);
	}



}
