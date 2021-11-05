package com.hyunah.box.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyunah.box.model.Grade;

@Repository
public class GradeDaoImpl implements GradeDao {

	@Autowired
	SqlSession sql;
	
	
	@Override
	public Grade getGrade(String id) {
		return sql.selectOne("grade.getGrade", id);
	}



	@Override
	public void addGrade(String id) {
		sql.insert("grade.addGrade", id);
	}

	


}
