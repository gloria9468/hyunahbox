package com.hyunah.box.comm.service;

import java.util.List;

import com.hyunah.box.model.MemberRole;
import com.hyunah.box.model.Menu;

public interface MenuService {

	List<Menu> getMenuList(MemberRole memberRole);
	
}
