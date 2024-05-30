package com.hyunah.box.comm.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommDaoImpl implements CommDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public int getNextval(String seqName) {
		return sql.selectOne("comm.getNextval", seqName);
	}

}
