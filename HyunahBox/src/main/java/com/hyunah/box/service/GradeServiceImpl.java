package com.hyunah.box.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunah.box.dao.GradeDao;
import com.hyunah.box.model.Grade;

@Service
public class GradeServiceImpl implements GradeService {

	@Autowired
	GradeDao dao;

	@Override
	public Grade getGrade(String id) {
		return dao.getGrade(id);
	}

	@Override
	public void addGrade(String id) {
		dao.addGrade(id);
	}

}
