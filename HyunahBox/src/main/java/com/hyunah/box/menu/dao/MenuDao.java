package com.hyunah.box.menu.dao;

import java.util.List;

import com.hyunah.box.model.Member;
import com.hyunah.box.model.MemberRole;
import com.hyunah.box.model.Menu;

public interface MenuDao {

	List<Menu> getMenuList(Member member, String role);

}
