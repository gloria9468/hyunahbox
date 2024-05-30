package com.hyunah.box.comm.dao;

import java.util.List;

import com.hyunah.box.model.MemberRole;
import com.hyunah.box.model.Menu;

public interface MenuDao {

	List<Menu> getMenuList(MemberRole memberRole);

}
