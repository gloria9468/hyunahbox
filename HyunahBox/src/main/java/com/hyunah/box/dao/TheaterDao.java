package com.hyunah.box.dao;

import java.util.List;

import com.hyunah.box.model.Theater;

public interface TheaterDao{

	List<Theater> list();

	void add(Theater theater);

	Theater getItem(int theaterCode);

	void update(Theater theater);

	void delete(int theaterCode);

}
