package com.hyunah.box.service;

import com.hyunah.box.model.Grade;

public interface GradeService {

	Grade getGrade(String id);

	void addGrade(String id);

}
