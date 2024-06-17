package com.hyunah.box.service;

import java.util.List;

import com.hyunah.box.model.Theater;

public interface TheaterService {

	List<Theater> list();

	int add(Theater theater);

	Theater getItem(int theaterCode);

	void update(Theater theater);

	void delete(int theaterCode);

	int theaterTotalCnt(Theater theater);


}
