package com.hyunah.box.menu.service;

import java.util.List;

import com.hyunah.box.model.Member;
import com.hyunah.box.model.Menu;

public interface MenuService {

	List<Menu> getMenuList(Member member, String role);
	
}
