package com.hyunah.box.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyunah.box.model.Theater;


@Repository
public class TheaterDaoImpl implements TheaterDao{

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Theater> list() {
		return sql.selectList("theater.list");
	}

	@Override
	public int add(Theater theater) {
		return sql.insert("theater.add", theater);
	}

	@Override
	public Theater getItem(int theaterCode) {
		return sql.selectOne("theater.getItem", theaterCode);
	}

	@Override
	public void update(Theater theater) {
		sql.update("theater.update", theater);
	}

	@Override
	public void delete(int theaterCode) {
		sql.delete("theater.delete", theaterCode);
	}

	@Override
	public int theaterTotalCnt(Theater theater) {
		return sql.selectOne("theater.theaterTotCnt", theater);
	}

}
